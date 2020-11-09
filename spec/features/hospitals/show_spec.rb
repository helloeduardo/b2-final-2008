require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'As a Visitor' do
    before :each do
      @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = @hospital.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doctor_2 = @hospital.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      @doctor_3 = @hospital.doctors.create!(name: 'Miranda Bailey', specialty: 'Pediatric Surgery', university: 'Harvard University')
      @patient_1 = @doctor_1.patients.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = @doctor_1.patients.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = @doctor_2.patients.create!(name: 'Rebecca Pope', age: 32)

      visit hospital_path(@hospital)
    end

    it 'I see the hospital name' do
      expect(page).to have_content(@hospital.name)
    end

    it 'I see the number of doctors that work at this hospital' do
      expect(page).to have_content(@hospital.doctor_count)
    end

    it "I see a unique list of universities that this hospital's doctors attended" do
      within '.universities' do
        expect(page.all('li')[0]).to have_content(@doctor_1.university)
        expect(page.all('li')[1]).to have_content(@doctor_2.university)
        expect(page.all('li')[2]).to_not have_content(@doctor_3.university)
      end
    end
  end
end
