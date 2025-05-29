class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:edit, :update]
  
  def index
    @users = User.all
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).reverse_order

    if @user == current_user
      # eachのnil➡必要なのは配列
      @favorite_blogs = current_user.favorite_blogs || []
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def authorize_user
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:alert] = 'このプロフィールを編集する権限がありません'
      redirect_to user_path(current_user) 
    end
  end
end


