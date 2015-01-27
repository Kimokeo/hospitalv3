class Doctor < ActiveRecord::Base
	has_many :patients
	has_many :hospitals
	
	belongs_to :doctoring, polymorphic: true
end
