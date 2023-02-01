class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend

  def after_sign_in_path_for(_resource)
    users_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email bio photo password confirm_password role])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email bio photo password current_password, role])
  end
end
