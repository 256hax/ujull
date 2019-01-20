class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates  :body, length: { in: 1..280 }
end
