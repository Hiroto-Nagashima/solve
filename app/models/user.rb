class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :relationships
  has_many :followings, through: :relationships

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :scores
  has_many :comments
  has_many :lilks
  has_many :posts

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def following?(user)
    relationships.find_by(user_id: user.id)
  end

  def follow(user)
    relationships.create!(user_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(user_id: user.id).destroy
  end

  # => "SELECT \"users\".* FROM \"users\" INNER JOIN \"relationships\" ON \"users\".\"id\" = \"relationships\".\"user_id\" WHERE \"relationships\".\"user_id\" = 1"
  # => "SELECT \"users\".* FROM \"users\" INNER JOIN \"relationships\" ON \"users\".\"id\" = \"relationships\".\"follower_id\" WHERE \"relationships\".\"user_id\" = 1"
end
