require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'Relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = @hospital.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doctor_2 = @hospital.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      @doctor_3 = @hospital.doctors.create!(name: 'Miranda Bailey', specialty: 'Pediatric Surgery', university: 'Harvard University')
    end

    it '.doctor_count' do
      expect(@hospital.doctor_count).to eq(3)
    end

    it '.unique_universities' do
      expected = ['Harvard University', 'Johns Hopkins University']
      expect(@hospital.unique_universities).to eq(expected)
    end
  end
end
