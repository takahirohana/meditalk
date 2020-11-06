class MessagesController < ApplicationController
  def index

    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    # @symptom = Symptom.find(params[:symptom_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      redirect_to room_messages_path(@room)
    else
      @messges = @room.messages.includes(:user)
      render :index
    end
  end


  private
  def message_params
    params.require(:message).permit(:content, :image, :doctor_id).merge(user_id: current_user.id )
  end
end
