class SessionsController < ApplicationController
  def new
    @user = User.first
  end

  def create
    @user = User.first
    if @user.authenticate(params[:session][:password])
      flash[:success] = "文系学生と学ぶ社会学へようこそ!"
      log_in(@user)
      redirect_to root_url
    else
      flash[:danger] = "パスワードが違います。"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
end
