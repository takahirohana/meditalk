class DoctorsController < ApplicationController
  def index
      @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render :index
    else
      render :new
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :area, :speciality, :word)
  end
end

