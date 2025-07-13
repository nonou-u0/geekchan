class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:referred_by))  # ← referred_byを除いて
    @user.referred_by = params[:user][:referred_by] 

    if @user.save
      flash[:notice] = "ユーザー認証メールを送信いたしました。認証が完了しましたらログインをお願いいたします。"
      redirect_to new_user_session_path
    else
      flash[:alert] = "ユーザー登録に失敗しました。"
      render action: :new and return
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :referred_by)
    end
  end