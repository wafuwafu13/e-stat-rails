class BlogsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def create
        @blog = current_user.blogs.build(blog_params)
        binding.pry
        if @blog.save
            flash[:success] = "ブログが作成されました！"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy
        @blog.destroy
        flash[:success] = "ブログを削除しました"
        redirect_to request.referrer || root_url
    end

    private
      
      def blog_params
        params.require(:blog).permit(:content)
      end

      def correct_user
        @blog = current_user.blogs.find_by(id: params[:id])
        redirect_to root_url if @blog.nil?
      end
    
end
