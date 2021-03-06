class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.build(user_id: current_user.id)
    like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: @post.id, user_id: current_user.id)
    like.destroy
  end

  def index
    @liked_posts = Post.joins(:likes).where(likes: { user_id: current_user.id })
    pp @liked_posts
    @day_score = current_user.day_scores.last
  end
end
