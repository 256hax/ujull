class Users::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @record_count = 1000.freeze
    @messages = current_user.messages.recent_with_comments(@record_count)
  end
end
