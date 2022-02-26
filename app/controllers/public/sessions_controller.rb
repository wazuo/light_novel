# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # ログイン後の遷移先(マイページへ)
  def after_sign_in_path_for(_resource)
    member_path(@member)
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # 退会しているかを判断するメソッド
  def member_state
    # 「処理内容」入力されたEmailからアカウントを一件取得
    @member = Member.find_by(email: params[:member][:email])
    return unless @member && (@member.valid_passward?(params[:member][:password]) && (@member.is_deleted == false))

    redirect_to new_member_registration
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
