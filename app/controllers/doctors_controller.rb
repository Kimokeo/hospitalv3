class DoctorsController < ApplicationController
	def index
		@doctors = Doctor.all
	end

	def new
		@hospitals = Hospital.all
		@patients = Patient.all
		@doctor = Doctor.new
	end

	def create
		@doctor = Doctor.create doc_params
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
			:doctoring_id,
			:patient_ids: [],
			:hospital_ids: []
			)
