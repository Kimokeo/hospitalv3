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







end
