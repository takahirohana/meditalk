class SymptomsController < ApplicationController
  def edit
    @symptom = Symptom.find_by(id: params[:id])
  end

  def update
    @symptom = Symptom.find_by(id: params[:id])
    if current_user.symptom.update(symptom_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:cc, :from_when, :where, :situation, :ph, :allergies, :medicine)
  end
end
