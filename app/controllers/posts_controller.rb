class PostsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.questions.build(question_params)
    @post.save
      # @post.questions.each do |question|
      #   question.post_id = @post.id
      #   question.direction = params[:question][:direction]
      #   question.correct_answer = params[:post][:correct_answer]
      #   question.save
      # end
    
    redirect_to users_path
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
  def question_params
    params.require(:question).permit(:direction,:correct_answer)
  end
end
