class UsersController < ApplicationController

  def edit
    @user = User.first
  end

  def update
    @user = User.first
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to request.referrer || root_url
    else
      render 'edit'
    end
  end

  # def authenticate
  #   @user = User.first
  # end

  # def jadge
  #   @user = User.first
  #   if @user.password == mariobaske13
  #     flash[:success] = "パスワードあってる"
  #     redirect_to request.referrer || root_url
  #   else
  #     flash[:danger] = "パスワード違う"
  #     redirect_to request.referrer || root_url
  #   end
  # end

  private

    def user_params
      params.require(:user).permit(:name, :image, :introduction, :password)
    end
end
