# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def create
    # ログインに成功した時の処理
    super do |resource|
      flash[:notice] = "ようこそ、#{resource.name}🌼" 
    end
  end

  def destroy
    user_name = current_user.name
    super do
      flash[:notice] = "#{user_name}、また来てね🌼" 
    end
  end
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
