class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
  has_one    :users_summary, class_name: 'Users::Summary', :through => :user

  validates  :body, length: { in: 1..280 }

  scope :group_by_message_id, -> {
    includes(:message)
    .select(:message_id)
    .group(:message_id)
    .order(message_id: :desc)
  }

  def parent_messages_with_all_comments(message_ids)
    # Abstract => SELECT * FROM comments WHERE message_id IN ($1, $2, ...)
    Message.includes(:comments).where(id: message_ids).order(id: :desc)
  end
end
