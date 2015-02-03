class PatientsController < ApplicationController
	before_action :set_patient, only: [
		:show,
		:edit,
		:update,
		:destroy,
		:waiting_room_patient,
		:checkup_patient,
    :xray_patient,
    :surgery_patient,
		:billing_patient,
		:discharged_patient,
	]
	def index
		@patients = Patient.all
	end

	def new
		@patient = Patient.new
	end

	def create

		@patient = Patient.create que_params
		if @patient.save
			flash[:notice] = 'Patient data was successfully created.'
			redirect_to patients_path
		else
			flash[:error] = "Patient data was NOT saved."
			render :new
		end
	end

	def edit
		@patient = Patient.find params[:id]
	end

	def update
		@patient = Patient.find params[:id]
		@patient.update_attributes que_params
		if @patient.save
			flash[:notice] = 'Patient data was successfully created.'
			redirect_to root_path
		else
			flash[:error] = "Patient data was NOT saved."
			render :new
		end

	end

	def show
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:id]
		@medications = @patient.medications

	end

	def destroy
		@patient = Patient.find params[:id]
		@patient.destroy
		redirect_to hospitals_path
	end

	def wait_patient
		@patient.wait!
		redirect_to patients_path
	end

	def exam_patient
		@patient.exam!
		redirect_to patients_path
	end

	def scan_patient
		@patient.scan!
		redirect_to patients_path
	end

	def operation_patient
		@patient.operation!
		redirect_to patients_path
	end

	def checkout_patient
		@patient.checkout!
		redirect_to patients_path
	end

	def leave_patient
		@patient.leave!
		redirect_to patients_path
	end

	private
	def que_params
		params.require(:patient).permit(
			:first_name,
			:last_name,
			:dob,
			:description,
			:gender,
			:blood_type,
			)
	end

	def set_patient
		@patient = Patient.find(params[:id])
	end

end

