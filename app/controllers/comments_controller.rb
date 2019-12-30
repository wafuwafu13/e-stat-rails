class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_to @comment.blog
    else 
      redirect_to request.referrer || root_url, flash: {
        error_messages: @comment.errors.full_messages
      }
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:blog_id, :content, :mail, :name, :password, :title, :url)

    end

end
