class Question < ApplicationRecord
  has_many :answers
  belongs_to :post
  serialize :wrong_choices

  validates :correct_choice, :first_wrong_choice, :second_wrong_choice, :direction, :question, presence: true
end
