class Skill < ApplicationRecord
	include Placeholder

	validates_presence_of :title, :daily_percent_skill


	#after_initialize tells app to use defaults values of attribute (portfolio, as we are in portfolio model) if none were provided during initilizing process
	after_initialize :set_defaults

	#set_defaults method tells app what defaults values should be; ||= -> this operand works like -> if side.left == nil, side.left == side.right
	def set_defaults
		self.badge ||= Placeholder.image_generator(height: '150', width: '150')
	end
end
