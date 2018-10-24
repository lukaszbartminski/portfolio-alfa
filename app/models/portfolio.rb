class Portfolio < ApplicationRecord
	#has_many says, Portfolio model may have many technologies, for example Ruby, RoR and HTML
	has_many :technologies

	#It simply accepts nested attributes, what means, I can create portfolio item in DB, and while creating this new item, I can create as many as I decide, techonologies attributes, also in DB, related to this new portfolio item. This is why we call it 'nested'.
	accepts_nested_attributes_for :technologies, #reject_if rejects creation procces if no 'name' of nested attributes (at least one) is provided. But still, you can create Portfolio item without any nested attributes, at least at console.
								   reject_if: lambda { |attrs| attrs['title'].blank? }

	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.show_only_angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :show_only_ruby, -> {where(subtitle: 'Ruby on Rails')}

	#after_initialize tells app to use defaults values of attribute (portfolio, as we are in portfolio model) if none were provided during initilizing process
	after_initialize :set_defaults

	#set_defaults method tells app what defaults values should be; ||= -> this operand works like -> if side.left == nil, side.left == side.right
	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end
