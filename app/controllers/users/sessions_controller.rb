# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: [:create, :destroy]) { request.env["devise.skip_timeout"] = true }

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(current_user), notice: "ゲストユーザーとしてログインしました。"
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to user_path(current_user), notice: "ゲスト管理者ユーザーとしてログインしました。"
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    # super
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    redirect_to home_top_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
