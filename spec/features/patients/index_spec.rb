require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  describe 'As a Visitor' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)

      visit patients_path
    end

    it 'I see all patient names ordered from oldest to youngest' do
      within '.patients' do
        expect(page.all('li')[0]).to have_content(@patient_2.name)
        expect(page.all('li')[1]).to have_content(@patient_3.name)
        expect(page.all('li')[2]).to have_content(@patient_1.name)
      end
    end
  end
end
