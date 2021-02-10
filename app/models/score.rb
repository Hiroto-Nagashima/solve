class Score < ApplicationRecord
  has_many :answer
  belongs_to :user
  belongs_to :post
end
