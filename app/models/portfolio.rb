class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.show_only_angular
		where(subtitle: 'Angular')
	end

	def self.show_only_ruby
		where(subtitle: 'Ruby on Rails')
	end
end
