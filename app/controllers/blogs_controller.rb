class BlogsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit]
    before_action :correct_user, only: :destroy

    def index
      @blogs = current_user.blogs.paginate(page: params[:page], per_page: 5)
    end

    def show
      @blog = Blog.find(params[:id])
      @comment = Comment.new(blog_id: @blog.id)
    end

    def new
      @blog = Blog.new()
    end
        
    def create
      @blog = current_user.blogs.build(blog_params)
      if @blog.save
          flash[:success] = "ブログが作成されました！"
          redirect_to select_blog_path(@blog)
      else
          redirect_to new_blog_path
          flash[:danger] = "タイトルまたは本文が空です。"
      end
    end

    def destroy
      @blog.destroy
      flash[:success] = "ブログを削除しました"
      redirect_to request.referrer || root_url
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        flash[:success] = "ブログを編集しました"
        redirect_to select_blog_path(@blog)
      else
        render 'edit'
      end
    end

    def management
      @blogs = current_user.blogs.paginate(page: params[:page], per_page: 20)
    end

    def select
      @blog = Blog.find(params[:id])
    end

    private
      
      def blog_params
        params.require(:blog).permit(:title, :content, :picture)
      end

      def correct_user
        @blog = current_user.blogs.find_by(id: params[:id])
        redirect_to root_url if @blog.nil?
      end
    
end
