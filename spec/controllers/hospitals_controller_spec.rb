require 'rails_helper'

describe HospitalsController do
	let(:hospital) {
		Hospital.create({name: "testlocale", description: "I have attributes an stuff."})
	}

	describe "GET show information" do
		it 'should show hospital attributes' do
			get :show, id: hospital
				expect(assigns(:hospital)).to eq hospital
				expect(assigns(:patients).length).to eq(0)
				expect(assigns(:patients).class).to eq(Patient::ActiveRecord_Associations_CollectionProxy)
		end
	end

	describe "GET new information" do
		it 'should initialize hospital creation' do
			get :new
			expect(assigns(:hospital).class).to eq hospital
			expect(assigns(:hospital).new_record?).to eq(true)
		end
	end

	describe "post create_hospital" do
		it 'should create hospital with attributes' do
			post :create_hospital, id: hospital, hospital: { description: "level 30 white mage"}
			expect(assigns(:hospital)).to eq hospital
			expect(assigns(:hospital).class).to eq hospital
		end
	end
end

