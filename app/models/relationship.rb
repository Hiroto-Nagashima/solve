class Relationship < ApplicationRecord
  belongs_to :following, foreign_key: :user_id, class_name: 'User'
  belongs_to :follower, foreign_key: :follower_id,class_name: 'User'
  validates :follower_id, presence: true
  validates :user_id, presence: true
end


# relationship = Relationship.find(1)



# relationship.user


# relationship.follower
