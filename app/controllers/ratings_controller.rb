class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @ratings = @doctor.ratings
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to doctor_ratings_path(@rating.doctor)
    else
      @doctor = Doctor.find(params[:doctor_id])
      render 'doctors/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:doctor_id, :score, :content)
  end
end
