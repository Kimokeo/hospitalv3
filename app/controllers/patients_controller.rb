class PatientsController < ApplicationController
	before_action :set_patient_id, :set_hospital_id, only: [
		:show,
		:edit,
		:update,
		:destroy
	]
	def index
		@patientpag = Patient.paginate(:per_page => 12, :page => params[:page])
		@patients = if !params[:q].blank?
			Patient.where("first_name LIKE ? OR description Like ?", "%#{params[:q]}%", "%#{params[:q]}%")
		else
			Patient.all
		end.shuffle
	end

	def new
		@hospital = Hospital.find params[:id]
		@patient = @hospital.patients.new
	end

	def create
		@hospital = Hospital.find params[:id]
		@patient = @hospital.patients.create que_params
		if @patient.save
			flash[:notice] = 'Patient data was successfully created.'
			redirect_to patients_path
		else
			flash[:error] = "Patient data was NOT saved."
			render :new
		end
	end

	def edit
		@hospital = Hospital.find params[:hospital_id]
		@patient = @hospital.patient.find params[:id]
	end

	def update
		@hospital = Hospital.find params[:hospital_id]
		@patient = @hospital.patient.find params[:id]
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
		# @hospital = Hospital.find params[:hospital_id]
		# @patient = @hospital.patients.find params[:id]
		@medications = @patient.medications
	end

	def destroy
		@patient = Patient.find params[:id]
		@patient.destroy
		redirect_to hospitals_path
	end

	def search_results
		@patients = Patient.where("first_name LIKE ? OR description Like ?", "%#{params[:q]}%", "%#{params[:q]}%")
		respond_to do |format|
			format.js
			format.html
		end
	end

# ajax workflow state controllers

	def set_patient_id
		@patient = Patient.find params[:id]
	end

	def set_hospital_id
		@hospital = Hospital.find params[:id]
	end

	def patient_waiting_room
		set_patient_id
		@patient.wait!
		redirect_to patients_path
		respond_to do |format|
			format.js
		end
	end

	def patient_checkup
		set_patient_id
		@patient.exam!
		redirect_to patients_path
		respond_to do |format|
			format.js
		end
	end

	def patient_xray
		set_patient_id
		@patient.scan!
		redirect_to patients_path
		respond_to do |format|
			format.js
		end
	end

	def patient_surgery
		set_patient_id
		@patient.operation!
		redirect_to patients_path
		respond_to do |format|
			format.js
		end
	end

	def patient_billing
		set_patient_id
		@patient.checkout!
		redirect_to patients_path
		respond_to do |format|
			format.js
		end
	end

	def patient_discharged
		set_patient_id
		@patient.leave!
		redirect_to patients_path
		respond_to do |format|
			format.js
    end
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
      patient_ids: [],
      medication_ids: [],
			)
	end
end

