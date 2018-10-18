class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include SetSource

	# nullObject pattern
	def current_user
		super || OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
	end
end
