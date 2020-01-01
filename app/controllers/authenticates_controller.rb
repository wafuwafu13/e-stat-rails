class AuthenticatesController < ApplicationController
    def index

    end
    def new
      @user = User.first
    end

    def create
      if params[:pass] == "mariobaske13"
        flash[:success] = "パスワードあってる"
        redirect_to request.referrer || root_url
      else
        flash[:danger] = "パスワード違う"
        redirect_to request.referrer || root_url
      end
    end

    def update
    end
end
