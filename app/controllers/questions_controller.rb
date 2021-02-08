class QuestionsController < ApplicationController
  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  def go

    target_id = params[:post_id] 

    target_question_list = Question.where(post_id: target_id)

    render json: target_question_list.to_json
  end
end
