module DeviseWhitelist
	# 'extend ActiveSupport::Concern' is just for simplify the code above. More details here: https://api.rubyonrails.org/v5.2.1/classes/ActiveSupport/Concern.html
	# Moreover, 'included do' is part of this^.
	extend ActiveSupport::Concern
	
	# before_action -> whatever I run in application_controller (and others, because they inherit from application_controller) I want to run the code in the before_action block
	# In addition, I can say for what controller execatelly I want to run the method 'configure_permitted_parameters'. So, before_action will run before every controller action, and will check what is controller name ~> if it is devise_controller, it will run 'configure_permitted_parameters' method
	included do 
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	# 'configure_permitted_parameters' whitelist given attributes, so now we can create User with name
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end