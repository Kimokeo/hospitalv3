class HospitalsController < ApplicationController
	before_action :set_hospital_id, only: [
		:show,
		:edit,
		:update,
		:destroy
	]
	def index
		@hospitals = if !params[:q].blank?
			Hospital.where("name LIKE ? OR description Like ?", "%#{params[:q]}%", "%#{params[:q]}%")
		else
			Hospital.all
		end.shuffle
	end

	def show
		@hospital = Hospital.find params[:id]
		@patients = @hospital.patients
	end

	def new
		@hospital = Hospital.new
	end

	def edit
		@hospital = Hospital.find params[:id]
	end

	def create
		@hospital = Hospital.new(hospital_params)
			if @hospital.save
				flash[:notice] = "Hospital has been successfully saved"
				redirect_to hospitals_path
			else
				flash[:error] = "Hospital was not saved"
			end
	end

	def update
		@hospital = Hospital.find params[:id]
		@hospital.update(hospital_params)
			if @hospital.save
    	flash[:notice] = 'Hospital data was successfully created.'
    	redirect_to hospital_path
    else
    	flash[:error] = "Hospital data was NOT saved."
    	render :new
		end
	end

	def destroy
		@hospital = Hospital.find params[:id]
		@hospital.delete
		redirect_to root_path
	end

	def set_hospital_id
		@hospital = Hospital.find params[:id]
	end

private

	def hospital_params
		params.require(:hospital).permit(
			:name,
			:description,
			:address,
			:city,
			)
	end
end

