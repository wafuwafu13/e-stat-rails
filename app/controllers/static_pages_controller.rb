class StaticPagesController < ApplicationController

  def home
    @user = User.first
  end

  def help
  end

  def about
  end

  def contact
  end
end
