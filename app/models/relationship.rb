class Relationship < ApplicationRecord
  belongs_to :follow, foreign_key: :user_id, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end


# relationship = Relationship.find(1)



# relationship.user


# relationship.follower
