class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.show_only_angular
		where(subtitle: 'Angular')
	end

	scope :show_only_ruby, -> {where(subtitle: 'Ruby on Rails')}

	#after_initialize tells app to use defaults values of attribute (portfolio, as we are in portfolio model) if none were provided during initilizing process
	after_initialize :set_defaults

	#set_defaults method tells app what defaults values should be; ||= -> this operand works like -> if side.left == nil, side.left == side.right
	def set_defaults
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
	end
end
