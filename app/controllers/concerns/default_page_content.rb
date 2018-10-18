module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Lucas Portfolio | Home For My Projects"
		@seo_keywords = "Lukasz Bartminski portfolio"
	end
end