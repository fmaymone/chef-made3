class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	before_action :print
  
	def print
	 logger.debug '**************************************************' 
	 logger.debug 'OmniauthCallbacksController'
	 logger.debug '**************************************************' 
	
	
	end
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])	

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end
	def google_oauth2
	  @user = User.from_omniauth(request.env["omniauth.auth"])    
	
	  if @user.persisted?
	      sign_in_and_redirect @user, :event => :authentication
	      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
	  else
	      session["devise.google_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	  end
	end
	

	
	

end