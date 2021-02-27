class RanksController < ApplicationController
  before_action :authenticate_user!
  def index
    @weekly_tango_likes =Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 0).group(:id).order(Arel.sql('count(likes.id) desc')).sample(5);
    @weekly_bunpou_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 1).group(:id).order(Arel.sql('count(likes.id) desc')).sample(5);
    @monthly_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_month}).group(:id).order(Arel.sql('count(likes.id) desc')).sample(5);
    @weekly_scores = DayScore.joins(:user).limit(5).where(day_scores: {created_at: Time.now.all_week}).where.not(user_id: 2).order(sum_day_score: "desc").group(:user_id).select("day_scores.*, users.name as name, sum(day_score) as sum_day_score");
  end
end
