class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  after_create :create_day_score
  has_many :relationships,dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follower_id',dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :posts,dependent: :destroy
  has_many :day_scores


  validates :encrypted_password , presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, confirmation: true
  validates :name , presence: true, length: { maximum: 30 }
  validates :introduction , length: { maximum: 200 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def following?(user)
    self.followings.include?(user)
  end

  def follow(user)
    # relationships.create!(user_id: user.id, follower_id: 8) # user.id = 3
    relationships.create!(follower_id: user.id).save() # user.id = 8

  end

  def unfollow(user)
    relationships.find_by(follower_id: user.id).destroy
  end

  def create_day_score
     DayScore.create!(user_id: self.id, start_time: Time.zone.now)
  end
  # => "SELECT \"users\".* FROM \"users\" INNER JOIN \"relationships\" ON \"users\".\"id\" = \"relationships\".\"user_id\" WHERE \"relationships\".\"user_id\" = 1"
  # => "SELECT \"users\".* FROM \"users\" INNER JOIN \"relationships\" ON \"users\".\"id\" = \"relationships\".\"follower_id\" WHERE \"relationships\".\"user_id\" = 1"
end
