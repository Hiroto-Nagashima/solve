class RanksController < ApplicationController
  def index
    @weekly_tango_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 0).group(:id).order('count(likes.id) desc').sample(5);
    @weekly_bunpou_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 1).group(:id).order('count(likes.id) desc').sample(5);
    @monthly_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_month}).group(:id).order('count(likes.id) desc').sample(5);
    @monthly_scores = User.joins(:day_scores).where(day_scores: {created_at: Time.now.all_month}).where.not(users: {id: 1}).group(:id).order('sum(day_scores.day_score) desc').sample(5);
  end
end
