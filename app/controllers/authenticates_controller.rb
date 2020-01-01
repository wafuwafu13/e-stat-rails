class AuthenticatesController < ApplicationController
    def index

    end
    def new
      @user = User.first
    end

    def create
      if params[:password] == "mariobaske13"
        redirect_to edit_blog_path(@blog)
      else
        flash[:danger] = "パスワード違う"
        redirect_to request.referrer || root_url
      end
    end

    def update
    end
end
