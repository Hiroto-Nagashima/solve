class Question < ApplicationRecord
  has_many :answers
  belongs_to :post
  serialize :wrong_choices
end
