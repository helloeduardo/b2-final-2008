require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Doctor Show Page' do
  describe 'As a Visitor' do
    before :each do
      @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = @hospital.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doctor_2 = @hospital.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      @patient_1 = @doctor_1.patients.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = @doctor_1.patients.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = @doctor_2.patients.create!(name: 'Rebecca Pope', age: 32)

      visit doctor_path(@doctor_1)
    end

    it 'I see all of that doctor information' do
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
    end

    it 'I see the name of the hospital where this doctor works' do
      expect(page).to have_content(@doctor_1.hospital.name)
    end

    it 'I see the names of all the patients this doctor has' do
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to_not have_content(@patient_3.name)
    end
  end
end
