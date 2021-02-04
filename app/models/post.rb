class Post < ApplicationRecord
  has_many :scores,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :questions,dependent: :destroy
  has_many :likes,dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :questions, allow_destroy: true
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
