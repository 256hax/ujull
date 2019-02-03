class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @like = Like.create(user_id: current_user.id, message_id: params[:message_id])
    @likes = Like.where(message_id: params[:message_id])
    @message.reload
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end
end
