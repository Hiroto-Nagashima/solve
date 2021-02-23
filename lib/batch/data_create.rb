class Batch::DataCreate
  require 'active_support/core_ext/time'
  # def jst(time)
  #   Time.zone = 'Asia/Tokyo'
  #   Time.zone.parse(time).localtime($system_utc_offset)
  # end
  def self.data_create
    Time.zone = 'Asia/Tokyo'
    User.find_each do |user|
      DayScore.create!(user_id: user.id,day_score: "0",start_time: Time.zone.now)
    end
    p "一日の始まりです"
  end
end
