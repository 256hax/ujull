class Users::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    message_ids = current_user.comments.group_by_message_id
    @messages = Comment.new().parent_messages_with_all_comments(message_ids)
  end
end
