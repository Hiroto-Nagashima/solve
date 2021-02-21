class DayScore < ApplicationRecord
  has_many :scores
  belongs_to :user
end
