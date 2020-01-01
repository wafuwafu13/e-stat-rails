class BlogsController < ApplicationController

    def index
      @blogs = Blog.where(user_id: 1).paginate(page: params[:page], per_page: 5)
      @user = User.first
    end

    def show
      @blog = Blog.find(params[:id])
      @comment = Comment.new(blog_id: @blog.id)
      @comments = @blog.comments
      @user = User.first
    end

    def new
      @blog = Blog.new()
      @user = User.first
    end
        
    def create
      @blog = User.first.blogs.build(blog_params)
      if @blog.save
          flash[:success] = "ブログが作成されました！"
          redirect_to select_blog_path(@blog)
      else
          flash[:danger] = "タイトルまたは本文が空です"
          redirect_to new_blog_path
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      if logged_in?
        @blog.destroy
        flash[:success] = "ブログを削除しました"
        redirect_to request.referrer || root_url
      else
        flash[:danger] = "ログインが必要です"
        redirect_to login_path
      end
    end

    def edit
      @blog = Blog.find(params[:id])
      @user = User.first
      if logged_in?
        render 'edit'
      else
        flash[:danger] = "ログインが必要です"
        redirect_to login_path
      end
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        flash[:success] = "ブログを編集しました"
        redirect_to select_blog_path(@blog)
      else
        flash[:danger] = "タイトルまたは本文が空です"
        render 'edit'
      end
    end

    def management
      @blogs = Blog.where(user_id: 1).paginate(page: params[:page], per_page: 20)
      @user = User.first
    end

    def select
      @blog = Blog.find(params[:id])
      @user = User.first
    end

    private
      
      def blog_params
        params.require(:blog).permit(:title, :content, :picture)
      end
    
end
