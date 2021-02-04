class Score < ApplicationRecord
  before_action :authenticate_user!
  has_many :answer
  belongs_to :user
  belongs_to :post
end
