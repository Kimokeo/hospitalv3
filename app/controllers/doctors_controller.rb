class DoctorsController < ApplicationController
	def index
		@doctors = if !params[:q].blank?
			Doctor.where("name LIKE ? OR description Like ?", "%#{params[:q]}%", "%#{params[:q]}%")
		else
			Doctor.all
		end.shuffle
	end

	def new
		@hospitals = Hospital.all
		@patients = Patient.all
		@doctor = Doctor.new
	end

	def create
		@doctor = Doctor.create doc_params
		@hospitals = Hospital.all
		redirect_to doctor_path(@doctor)
	end

	def edit
		@hospitals = Hospital.all
		@patients = Patient.all
		@doctor = Doctor.find params[:id]
	end

	def destroy
		@doctor = Doctor.find params[:id]
		@doctor.destroy
		redirect_to doctors_path
	end

private
	def doc_params
		params.require(:doctor).permit(
			:name,
			:doctoring_type,
			patient_ids: [],
			hospital_ids: []
			)
	end
end