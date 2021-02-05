class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @comment = Comment.new
    @posts = Post.all
    @posts.each do |post|
      @comments = post.comments.order(created_at: :desc)
    end
  end

  def show
    @user = User.find(params[:id])
    render :layout => 'compact'
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
   @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to users_path
     else
       render "edit"
     end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end
end