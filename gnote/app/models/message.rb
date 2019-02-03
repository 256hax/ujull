class Message < ApplicationRecord
  belongs_to :user
  has_many   :comments, -> { order(id: :asc) }, dependent: :destroy
  has_many   :likes, dependent: :destroy

  scope :recent, -> (count){
    order(id: :desc)
    .limit(count)
  }

  scope :recent_with_comments, -> (count){
    order(id: :desc)
    .limit(count)
    .includes(:comments)
    .order('comments.id desc')
  }

  validates :body, length: { in: 1..280 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
