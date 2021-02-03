class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    render :layout => 'compact'
  end
  def edit
  end
end
