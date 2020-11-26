class MessagesController < ApplicationController
  # def index

  #   @message = Message.new
  #   @room = Room.find(params[:room_id])
  #   @messages = @room.messages.includes(:user)
  #   @symptom = @room.user.symptom
  #   # @symptom = Symptom.find(params[:symptom_id])
  # end

  # def create
  #   @room = Room.find(params[:room_id])
  #   @message = @room.messages.new(message_params)
  #   if @message.save
  #     ActionCable.server.broadcast 'message_channel', content: @message
  #     redirect_to room_messages_path(@room)
  #   else
  #     @messges = @room.messages.includes(:user)
  #     render :index
  #   end
  # end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    # メッセージがuserによるものだったらis_user=true, shopによるものだったらis_user=false
    if user_signed_in?
      @message.is_user = true
    elsif doctor_signed_in?
      @message.is_user = false
    end
    @message.room_id = @room.id
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      redirect_to room_url(@room)
    else
      @messges = @room.messages.includes(:user)
      redirect_to room_url(@room)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
