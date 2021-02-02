class Answer < ApplicationRecord
  belongs_to :scores
  belongs_to :questions
end
