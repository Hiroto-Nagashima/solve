class Post < ApplicationRecord
  has_many :scores
  has_many :comments,dependent: :destroy
  has_many :questions
  has_many :likes
  belongs_to :user
end
