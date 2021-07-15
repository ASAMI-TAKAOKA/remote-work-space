class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # ユーザーのログインを確認する
  def signed_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image, :profile])
  end

end