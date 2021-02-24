class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @post = Post.find(params[:post_id])
    @question.post_id = @post.id
    if @question.save
      redirect_to confirm_post_question_path(@post, @question)
    else
      render "new"
    end
  end

  def confirm
    @post = Post.find(params[:post_id])
    @question = Question.find(params[:id])

  end

  def update
    @post = Post.find(params[:post_id])
    @question = Question.find(params[:id])
    @question.post_id = @post.id
    if @question.update(question_params)
      flash[:success] = "You have updated your question successfully."
      redirect_to confirm_post_question_path(@post, @question)
    else
      render "confirm"
    end

  end


  def destroy
  end

  def new
    @post = Post.find(params[:post_id])
    @question = Question.new
  end

  def go

    target_id = params[:post_id]

    target_question_list = Question.where(post_id: target_id)

    render json: target_question_list.to_json

  end

  def save_choice
    currentNum = params[:currentNum]
    @post = Post.find(params[:post_id])
    choice_class = params[:choice_class]
    question = Question.find(params[:question_id])
    score = Score.new
    score.post_id = params[:post_id]
    unless user_signed_in?
      user = User.find(2)
      score.day_score_id = user.day_scores.last.id
    else
      score.day_score_id = current_user.day_scores.last.id
    end
    score.score = "0"

    if currentNum == "0"

      score.save!
      answer = Answer.new
      answer.personal_answer = params[:choice_class]
      answer.question_id = params[:question_id]
      answer.score_id = score.id
      answer.save
    else
      answer = Answer.new
      answer.personal_answer = params[:choice_class]
      answer.question_id = params[:question_id]
      unless user_signed_in?
        user = User.find(2)
        day_score = user.day_scores.last
        score = day_score.scores.last
        answer.score_id = score.id
      else
        day_score = current_user.day_scores.last
        answer.score_id = day_score.scores.last.id
      end
      answer.save
    end
      render json: {choice_class: choice_class , question: question ,questions: @post.questions}.to_json
  end

  def continue
    unless user_signed_in?
      post_id = "1"
    else
      day_score = current_user.day_scores.last
      score = day_score.scores.last
      post_id = score.post_id
    end
    @post = Post.find_by(id: post_id)
    questions = @post.questions
    render json: questions.to_json
  end

  def result
    unless user_signed_in?
      user = User.find(2)
      day_score = user.day_scores.last
      score = day_score.scores.last
    else
      day_score = current_user.day_scores.last
      score = day_score.scores.last
    end
    correct_answers = Answer.where(score_id: score.id , personal_answer: "correct_choice")
    score.score = correct_answers.size
    score.save
    day_score.day_score += score.score
    day_score.save
    render json: score.to_json
  end

  def replay
    unless user_signed_in?
      user = User.find(2)
      day_score = user.day_scores.last
      score = day_score.scores.last
    else
      day_score = current_user.day_scores.last
      score = day_score.scores.last
    end
    post_id = score.post_id
    target_question_list = Question.where(post_id: post_id)
    render json: target_question_list.to_json

  end

  def question_params
    params.require(:question).permit(:direction,:question,:correct_choice,:first_wrong_choice,:second_wrong_choice,:explanation)
  end
end
