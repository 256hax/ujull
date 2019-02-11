class Users::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.comments.new().parent_messages_with_all_comments
  end
end
