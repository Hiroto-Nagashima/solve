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
    #url /questions/go?kuam=渡したいid でアクセスされたとする
    hai = params[:kuam]
    # post取得
    target_id = 56 # 本来はajaxでurlを指定するときに一緒に定義する
    target_question_list = Question.where(post_id: target_id)

    render json: target_question_list.to_json
  end
end
