class Users::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.messages.recent_with_comments(1000)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to root_path if @message.nil?
  end
end
