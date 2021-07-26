class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  # POST /resource
  def create
    super do                                             # 他はdeviseの機能をそのまま流用する
      resource.update(confirmed_at: Time .now.utc)       # Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
    end
  end



  def ensure_normal_user
    if resource.email == 'guest@example.com'
    flash[:danger] = "ゲストユーザーは削除できません。"
    redirect_to root_path
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
    resource.image.attach(account_update_params[:image])
  end

end