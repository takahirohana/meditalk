class TopsController < ApplicationController
  def index
    if user_signed_in?
      @doctors = Doctor.all
      rooms = current_user.rooms
      # 自分が入っているroomの相手のidを格納する
      @doctor_ids = []
      rooms.each do |r|
        @doctor_ids << r.doctor_id
      end

    elsif doctor_signed_in?
      @users = User.all
      rooms = current_doctor.rooms
      # 自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
