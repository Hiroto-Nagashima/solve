class Batch::DataCreate
  def self.data_create
    User.find_each do |user|
      DayScore.create!(user_id: user.id,day_score: "0")
    end
    p "一日の始まりです"
  end
end
