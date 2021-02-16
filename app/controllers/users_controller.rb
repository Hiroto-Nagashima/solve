class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)


  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)

    current_todays_score_box = []
    @current_todays_scores = @user.scores.where(created_at: Time.zone.now.all_day)
    @current_todays_scores.each do |current_todays_score|
      current_todays_score_box << current_todays_score.score
    end
    @current_todays_score = current_todays_score_box.inject(:+)

    render :layout => 'compact'
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
  end

  def follower_list
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end
end