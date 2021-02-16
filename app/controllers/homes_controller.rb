class HomesController < ApplicationController
  def top

  end

  def go
    target_question_list = Question.where(post_id: 17)

    render json: target_question_list.to_json
  end

  def save_choice
    currentNum = params[:currentNum]
    @post = Post.find(17)
    choice_class = params[:choice_class]
    question = Question.find(params[:question_id])
    score = Score.new
    score.post_id = 17
    score.score = 0
    score.user_id = 0
    if currentNum == "0"
      score.save
      answer = Answer.new
      answer.personal_answer = params[:choice_class]
      answer.question_id = params[:question_id]
      answer.score_id = score.id
      answer.save
    else
      answer = Answer.new
      answer.personal_answer = params[:choice_class]
      answer.question_id = params[:question_id]
      answer.score_id = score.id
      answer.save
    end

    render json: {choice_class: choice_class , question: question ,questions: @post.questions}.to_json
  end

  def continue
    @post = Post.find(17)
    questions = @post.questions
    render json: questions.to_json
  end

  def result
    score = Score.new
    correct_answers = Answer.where(score_id: score.id , personal_answer: "correct_choice")
    score.score = correct_answers.size
    render json: score.to_json
  end

  def replay
    score = current_user.scores.last
    post_id = score.post_id
    target_question_list = Question.where(post_id: post_id)
    render json: target_question_list.to_json

  end


end
