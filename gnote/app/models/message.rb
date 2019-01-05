class Message < ApplicationRecord
  has_many :comments, -> { order(id: :asc) }, dependent: :destroy
  scope :recent, -> (count){ order(id: :desc).limit(count) }
  validates :body, length: { in: 1..280 }
end
