class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      　redirect_to root_path, danger: 'ゲストユーザーは削除できません。'
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
    resource.image.attach(account_update_params[:image])
  end

end