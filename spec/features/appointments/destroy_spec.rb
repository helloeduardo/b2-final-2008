require 'rails_helper'

RSpec.describe 'On Doctor Show Page' do
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

    it 'I see the link to remove a patient next to each patient name' do
      within "#patient-#{@patient_1.id}" do
        expect(page).to have_content("Remove and Cancel Appointments")
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_content("Remove and Cancel Appointments")
      end
    end

    it 'I can remove that patient from the doctor caseload' do
      within "#patient-#{@patient_2.id}" do
        click_link "Remove and Cancel Appointments"
      end

      expect(current_path).to eq(doctor_path(@doctor_1))

      expect(page).to have_content("The patient was successfully removed")
      expect(page).to_not have_content(@patient_2.name)
    end

    it "I still see a removed patient exists on the patient index page" do
      within "#patient-#{@patient_2.id}" do
        click_link "Remove and Cancel Appointments"
      end

      visit patients_path

      expect(page).to have_content(@patient_2.name)
    end
  end
end
