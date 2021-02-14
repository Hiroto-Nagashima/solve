class PostsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)
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

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content, :genre)
  end

  def question_params
    params.require(:question).permit(:direction,:question,:correct_choice,:first_wrong_choice,:second_wrong_choice,:explanation)
  end
end

