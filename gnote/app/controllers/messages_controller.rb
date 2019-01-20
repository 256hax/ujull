class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  include Encryptable # concerns/encryptable.rb
  include Informable # concerns/informable.rb

  def index
    @messages = Message.recent(20).includes(:comments)
  end

  def show
  end

  def new
    @message = current_user.messages.new
  end

  def edit
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.author_hash_ip = encrypt(get_remote_ip)

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, notice: '書き込みました！' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: '書き込みました！' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
      @note = current_user.messages.find_by(id: params[:id])
      redirect_to root_path if @note.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body)
    end
end
