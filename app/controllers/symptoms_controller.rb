class SymptomsController < ApplicationController

  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptom.new(symptom_params)
    if @symptom.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:cc, :from_when, :where, :situation, :ph, :allergies, :medicine).merge(user_id: current_user.id)
  end
end
