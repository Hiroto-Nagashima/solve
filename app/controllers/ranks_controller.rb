class RanksController < ApplicationController
  def index
    @weekly_tango_likes = Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 0).group(:id).order('count(likes.id) desc').limit(10);
  end
end
