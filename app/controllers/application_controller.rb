class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?
#  before_action :authenticate_user!

  

   # protected
  	 def configure_permitted_paramters
  	 #	devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
  	 #	devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description, :email, :password])
        devise_parameter_sanitizer.for(:sign_in)        << :fullname
        devise_parameter_sanitizer.for(:sign_up)        << :fullname
        devise_parameter_sanitizer.for(:account_update) << :fullname
  
  	 end



end
