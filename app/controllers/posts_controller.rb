class PostsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.questions.build(question_params)
    @post.update

    redirect_to posts_confirm_path
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to new_question_path
    else
      render "new"
    end
  end


  def confirm
    @posts = Post.where(user_id: current_user.id)
    @post = @posts.last
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def question_params
    params.require(:question).permit(:direction,:question,:correct_choice,:first_wrong_choice,:second_wrong_choice,:genre,:explanation)
  end
end
