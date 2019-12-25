class StaticPagesController < ApplicationController

  def home
    @blog = current_user.blog.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
