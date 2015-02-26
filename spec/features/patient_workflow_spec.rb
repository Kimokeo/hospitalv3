require 'rails_helper'
# set debug patient until I figure out a task for it
patient_path = "/patients/4"
describe 'test workflow button functions' do
	it 'should move from waiting room to checkup' do
		visit patient_path
		expect(page).to have_content("Current status: waiting room")
		click_link 'exam'
		expect(page).to have_content("Current status: checkup")
	end

	it 'should have disabled functions' do
		visit patient_path
		expect(page).to have_content("Current status: waiting room")
		expect(page).not_to have_content("leave")
	end

	it 'should move from checkup to xray' do
		visit patient_path
		expect(page).to have_content("Current status: checkup")
		click_link 'scan'
		expect(page).to have_content("Current status: xray")
	end
	
	it 'should have disabled functions' do
		visit patient_path
		expect(page).to have_content("Current status: checkup")
		expect(page).not_to have_content("wait")
	end

	it 'should move from xray to surgery' do
		visit patient_path
		expect(page).to have_content("Current status: xray")
		click_link 'operate'
		expect(page).to have_content("Current status: surgery")
	end

	it 'should have disabled functions' do
		visit patient_path
		expect(page).to have_content("Current status: xray")
		expect(page).not_to have_content("exam")
	end

	it 'should move from surgery to checkout' do
		visit patient_path
		expect(page).to have_content("Current status: surgery")
		click_link 'billing'
		expect(page).to have_content("Current status: checkout")
	end

	it 'should have disabled functions' do
		visit patient_path
		expect(page).to have_content("Current status: surgery")
		expect(page).not_to have_content("scan")
	end


	it 'should move from billing to discharged' do
		visit patient_path
		expect(page).to have_content("Current status: billing")
		click_link 'leave'
		expect(page).to have_content("Current status: discharged")
	end

	it 'should have disabled functions' do
		visit patient_path
		expect(page).to have_content("Current status: billing")
		expect(page).not_to have_content("scan")
	end
end
