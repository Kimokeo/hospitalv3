require 'rails_helper'

describe 'hospital registration' do
  it 'should register a hospital successfully' do
    visit hospitals_path
    click_link 'New hospital'
    fill_in 'Name', with: 'testhospital'
    fill_in 'Description', with: 'this is a test hospital'
    fill_in 'Address', with: '123 fake st'
    fill_in 'City', with: 'fakeville'
    click_button 'Create Hospital'
    expect(page).to have_content("testhospital")
    expect(page).to have_content("this is a test hospital")
    expect(page).to have_content("123 fake st")
    expect(page).to have_content("fakeville")
  end
end

describe 'patient registration' do
  it 'should register a patient successfully' do
    visit 'hospitals/4'
    click_link 'Add Patient'
    fill_in 'First name', with: 'test'
    fill_in 'Last name', with: 'buddy'
    fill_in 'Description', with: 'test problem'
    click_button 'male'
    click_button 'Blood type'
    click_button 'AB+'
    click_button 'Submit'
    expect(page).to have_content("test buddy")
    expect(page).to have_content("test problem")
    expect(page).to have_content("male")
    expect(page).to have_content("AB+")
  end
end

describe 'medication creation' do
	it 'should add medication to patient' do
		visit patients_path
		click_link 'Medications'
		click_link 'Add Medication'
		fill_in 'Name', with: 'testpill'
		fill_in 'Dose', with: '00mg'
		click_button 'Create Medication'
		click_link 'Medications'
		expect(page).to have_content("testpill")
		expect(page).to have_content("00mg")
	end
end