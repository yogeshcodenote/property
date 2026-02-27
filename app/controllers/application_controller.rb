class ApplicationController < ActionController::Base
  include Authentication
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_access!, unless: :devise_controller?
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end
  
  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
  
  def authorize_access!
    # Buyers can only access certain controllers
    if current_user&.buyer_user?
      allowed_controllers = ['dashboard', 'properties']
      if !allowed_controllers.include?(controller_name)
        redirect_to properties_path, alert: "You are not authorized to access this page."
      end
    end
  end
end
