class BlogsController < ApplicationController
    before_action :logged_in_user, only[:create, :destroy]

    def create
        @blog = current_user.blogs.build(blog_params)
        if @blog.save
            flash[:success] = "ブログが作成されました！"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
    end

    private
      
      def blog_params
        params.require(:blog).permit(:content)
      end
end
