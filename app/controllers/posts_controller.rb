class PostsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to users_path
  end

  def create
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
