class Patient < ActiveRecord::Base

	belongs_to :hospital
	has_many :patient_medications
	has_many :medications, through: :patient_medications


	BLOOD_TYPE_OPTIONS =[
		["A+", "A+"],
		["A-", "A-"],
		["AB+", "AB+"],
		["AB-", "AB-"],
		["O+", "O+"],
		["O-", "O-"],
		["B+", "B+"],
		["B-", "B-"],
	]
	validates :first_name, presence: true
	validates :description, presence: true
	validates :blood_type, presence: true
	validates :dob, presence: true
	validates :last_name, presence: true

include Workflow
workflow do 
	state :waiting_room do
		event :wait, transitions_to: :waiting_room
		event :exam, transitions_to: :checkup
		event :scan, transitions_to: :xray
		event :operation, transitions_to: :surgery
		event :leave, transitions_to: :discharged
	end

	state :checkup do
		event :scan, transitions_to: :xray
		event :checkout, transitions_to: :billing
		event :leave, transitions_to: :discharged

	end
  state :xray do
  	event :operation, transitions_to: :surgery
  	event :checkout, transitions_to: :billing
  	event :leave, transitions_to: :discharged

  end
  state :surgery  do
  	event :exam, transitions_to: :checkup
  	event :checkout, transitions_to: :billing
  	event :leave, transitions_to: :discharged

  end
	state	:billing do
		event :leave, transitions_to: :discharged

	end
	state	:discharged

	end
end


