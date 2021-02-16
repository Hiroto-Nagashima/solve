class Score < ApplicationRecord
  has_many :answer,dependent: :destroy
  belongs_to :user
  belongs_to :post
end
