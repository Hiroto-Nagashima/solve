class Batch::DataCreate
  require 'active_support/core_ext/time'

  def self.data_create
    User.find_each do |user|
      DayScore.create!(user_id: user.id, day_score: "0", start_time: Time.zone.now)
    end
    p "一日の始まりです"
  end
end
