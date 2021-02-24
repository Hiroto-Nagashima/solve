class UsersController < ApplicationController
before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)
    render :layout => 'mypage'
    @day_score = @user.day_scores.last.day_score
    # @day_scores = @user.day_scores
    # @monthly_scores = @day_scores.where(day_scores: {created_at: Time.now.all_month})

  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)
    @day_score = @user.day_scores.last.day_score

    # current_todays_score_box = []
    # @current_todays_scores = @user.scores.where(created_at: Time.zone.now.all_day)
    # @current_todays_scores.each do |current_todays_score|
    #   current_todays_score_box << current_todays_score.score
    # end
    # @current_todays_score = current_todays_score_box.inject(:+)

    render :layout => 'mypage'
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

  def follow_list
    @user = User.find(params[:user_id])
    @follows = @user.followings
    render :layout => 'compact'
  end

  def follower_list
    @user = User.find(params[:user_id])
    @followers = @user.followers
    render :layout => 'compact'
  end

  # def following
  #   @user  = User.find(params[:id])
  #   @users = @user.followings
  #   render 'show_follow'
  # end

  # def followers
  #   @user  = User.find(params[:id])
  #   @users = @user.followers
  #   render 'show_follower'
  # end

  def delete

  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end
end