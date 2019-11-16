class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :first_name,:last_name,:bio,:avatar,:role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :first_name,:last_name,:bio,:avatar,:role, :current_password)
    end
  end
  @user.avatar.attach(io: File.open('app/assets/images/placefolder.png'),
            filename: 'placeholder.png',content_type: 'image/png')
end
