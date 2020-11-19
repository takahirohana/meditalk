class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    @symptom = @room.user.symptom
    @user = @room.user
    @doctor = @room.doctor
    if user_signed_in?
      if @room.user.id == current_user.id
        @doctor = @room.doctor
      else
        redirect_to "/"
      end
    elsif doctor_signed_in?
      if @room.doctor.id == current_doctor.id
        @user = @room.user
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
      #userがログインしてたらuser_idを、doctorがログインしてたらdoctor_idを@roomにいれる
      @room = Room.new(room_doctor_params)
      @room.user_id = current_user.id
    elsif doctor_signed_in?
      @room = Room.new(room_user_params)
      @room.doctor_id = current_doctor.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_doctor_params
    params.require(:room).permit(:doctor_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
  # def index
  # end
  
  # def new
  #   @room = Room.new
  # end

  # def create
  #   @room = Room.new(room_params)
  #   if @room.save
  #     redirect_to rooms_path
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   room = Room.find(params[:id])
  #   room.destroy
  #   redirect_to root_path
  # end

  # private

  # def room_params
  #   params.require(:room).permit(:room_name,:doctor_id).merge(user_id: current_user.id)
  # end

