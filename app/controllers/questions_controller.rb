class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @posts = Post.where(user_id: current_user.id)
    @question.post_id = @posts.last.id
    if @question.save
      redirect_to posts_confirm_path
    else
      render "new"
    end
  end


  def destroy
  end

  def new
    @question = Question.new
  end

  def go

    target_id = params[:post_id]

    target_question_list = Question.where(post_id: target_id)

    render json: target_question_list.to_json
  end

  def question_params
    params.require(:question).permit(:direction,:question,:correct_choice,:first_wrong_choice,:second_wrong_choice,:genre,:explanation)
  end
end
