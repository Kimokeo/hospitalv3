require 'rails_helper'

RSpec.describe Hospital, type: :model do
	subject do
		testplace = Hospital.new({
			name: "la roux",
			description: "This must be the place"
			})
	end

	it { should have_many (:patients)}
	it { should have_many (:doctors)}

	it "should have identification" do
		testplace = Hospital.new
		testplace.hospital_id = "6"
		expect(testplace.hospital_id).not_to eq("nil")
	end

	it "should have attributes" do
		testplace = Hospital.new
		testplace.name = "la roux"
		testplace.description = "This must be the place"
		testplace.address = "123 fake st"
		testplace.city = "duck creek"
		expect(testplace.name).not_to eq("nil")
		expect(testplace.description).not_to eq("nil")
		expect(testplace.address).not_to eq("nil")
		expect(testplace.city).not_to eq("nil")
	end

	it "should hold multiple patients"
		testplace = Hospital.new
		testplace.hospital_id = "6"
		testbuddy1.hospital_id = "6"
		testbuddy2.hospital_id = "6"
		testbuddy3.hospital_id = "6"
		expect(testplace).to have("testbuddy1", "testbuddy2", "testbuddy3")
	end

	it "should have patients dependant on it"
		testplace = Hospital.new
		testplace.hospital_id = "6"
		testbuddy1.hospital_id = "6"
		expect(testplace.hospital_id).not_to eq("nil")
		expect(testbuddy1.hospital_id).not_to eq("nil")
		testplace.destroy
		expect(testplace.hospital_id).to eq("nil")
		expect(testbuddy1.hospital_id).to eq("nil")
	end
end