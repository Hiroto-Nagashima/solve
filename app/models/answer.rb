class Answer < ApplicationRecord
  belongs_to :scores, optional: true
  belongs_to :questions, optional: true
end
