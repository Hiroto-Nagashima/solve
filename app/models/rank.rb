class Rank < ApplicationRecord
  # def weekly_tango_likes()
  #   return Post.joins(:likes).where(likes: {created_at: Time.now.all_week},genre: 0).group(:id).order(Arel.sql('count(likes.id) desc')).sample(5);
  # end
end
