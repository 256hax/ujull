class Comment < ApplicationRecord
  belongs_to :message
  validates :body, length: { in: 1..280 }
end
