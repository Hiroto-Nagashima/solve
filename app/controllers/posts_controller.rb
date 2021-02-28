class PostsController < ApplicationController
before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @comment = Comment.new

    followings = current_user.followings.ids
    # フォローしているユーザーにカレントユーザーのIDを追加
    followings.push(current_user.id)
    @posts = Post.where(user_id: followings).order(created_at: :desc).page(params[:page]).per(50)

    @recommended_posts = []
    @recommended_users = User.where(created_at: Time.now.all_month ).where.not(id: current_user.id)
    @recommended_users.each do |ru|
      @recommended_posts << ru.posts.last if ru.posts.count > 0
      break if @recommended_posts.size == 4
    end

  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to new_post_question_path(@post.id)
    else
      render "new"
    end
  end

  def destroy
  end

  def search

    @posts = Post.search(params[:content])
  end

  private
  def post_params
    params.require(:post).permit(:content, :genre)
  end

  def question_params
    params.require(:question).permit(:direction,:question,:correct_choice,:first_wrong_choice,:second_wrong_choice,:explanation)
  end
end

