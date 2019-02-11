class Users::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.messages.recent_with_comments(1000)
  end
end
