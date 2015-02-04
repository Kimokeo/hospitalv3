class MedicationsController < ApplicationController
	def index
		@medications = if !params[:q].blank?
			Medication.where("name LIKE ? OR dose Like ?", "%#{params[:q]}%", "%#{params[:q]}%")
		else
			Medication.all
		end.shuffle
	end

	def new
		@medication = Medication.new
	end

	def create
		@medication = Medication.create med_params
		redirect_to patients_path
	end

	def edit
		@medication = Medication.find params[:id]
	end

	def update
		@medication = Medication.find params[:id]
		@medication.update_attributes med_params
		redirect_to patients_path
	end

	def destroy
		@medication = Medication.find params[:id]
		@medication.destroy
		redirect_to patients_path
	end
private
	def med_params
		params.require(:medication).permit(
			:name,
			:dose,
			)
	end
end