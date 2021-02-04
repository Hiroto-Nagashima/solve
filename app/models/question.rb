class Question < ApplicationRecord
  has_many :answers
  belongs_to :post
  enum genre: { 単語:0, 文法:1}
  serialize :wrong_choices
end
