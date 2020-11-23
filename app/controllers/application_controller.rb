class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :age])
      devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
    elsif resource_class == Doctor
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :area, :speciality, :word])
      devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
    else
      super
    end
  end
end
