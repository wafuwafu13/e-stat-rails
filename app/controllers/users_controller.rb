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

  private

    def user_params
      params.require(:user).permit(:name, :image, :introduction, :password)
    end
end
