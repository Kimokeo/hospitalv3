class PatientsController < ApplicationController
	def index
		@hospital = Hospital.find params[:hospital_id]
		@patients = Patient.all
	end

	def new
		@hospital = Hospital.find params[:hospital_id]
		@patient = @hospital.patients.new
	end

	def create
		@hospital = Hospital.find params[:hospital_id]
		@patient = @hospital.patients.create que_params
	if @patient.save
    	flash[:notice] = 'Patient data was successfully created.'
    	redirect_to hospital_path(@hospital)
    else
    	flash[:error] = "Patient data was NOT saved."
    	render :new
	end

	end

	def edit
		@hospital = Hospital.find params[:hospital_id]
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
		@patient.delete
		redirect_to root_path
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
end

