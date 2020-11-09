require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'Relationships' do
    it {should belong_to :patient}
    it {should belong_to :doctor}
  end
end
