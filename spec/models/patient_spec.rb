require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'Relationships' do
    it {should have_many :appointments}
    it {should have_many(:doctors).through(:appointments)}
  end

  describe 'class methods' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
    end

    it '.by_age' do
      expected = [@patient_2, @patient_3, @patient_1]
      expect(Patient.by_age).to eq(expected)
    end
  end
end
