require 'rails_helper'

RSpec.describe Patient, type: :model do
	subject do
		testbuddy = Patient.new({
			first_name: "ben",
			last_name: "jerry",
			description: "very delicious"
			})
	end
					# relationship tests
		it	{ should belong_to (:hospital) }
					# shoulda is a great gem
		it	{ should have_many (:medications ) }

	it "should have some identification" do
		testbuddy = Patient.new
		testbuddy.hospital_id = "4"
		testbuddy.id = "2"
		expect(testbuddy.hospital_id).not_to eq("nil")
		expect(testbuddy.id).not_to	eq("nil")
	end


# creation field tests
	it "should have a name" do
		patient = Patient.new
		patient.first_name = "benjr"
		expect(patient.first_name).to eq("benjr")
	end

	it "should have a last name" do
		patient = Patient.new
		patient.last_name = "jerryjr"
		expect(patient.last_name).to eq("jerryjr")
	end

	it "cant have a nil name" do
		patient = Patient.new
		patient.first_name = "benjr"
		patient.last_name = "jerryjr"
		expect(patient.first_name).not_to eq(nil)
		expect(patient.last_name).not_to eq(nil)
	end
# validation tests
	it "should validate first name upon creation" do
		benny = Patient.new
		benny.first_name = ""
		benny.save
		expect(benny.errors).to include(:first_name)
	end

	it "should validate last name upon creation" do
		benny = Patient.new
		benny.last_name = ""
		benny.save
		expect(benny.errors).to include(:last_name)
	end
end

