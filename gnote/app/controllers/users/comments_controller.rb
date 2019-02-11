class Users::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @record_count = 1000.freeze
    message_ids = current_user.comments.group_by_message_id
    @messages = Message.new().my_comments_with_all_messages(message_ids, @record_count)
  end
end
