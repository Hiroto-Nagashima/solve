class Score < ApplicationRecord
  has_many :answer,dependent: :destroy
  belongs_to :user
  belongs_to :post
  belongs_to :day_score
end
