class AppointmentsController < ApplicationController
  def destroy
    Appointment.where(doctor_id: params[:id], patient_id: params[:patient_id]).destroy_all
    flash[:notice] = "The patient was successfully removed"
    redirect_to "/doctors/#{params[:id]}"
  end
end
