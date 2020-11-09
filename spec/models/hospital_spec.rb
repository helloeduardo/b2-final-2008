require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'Relationships' do
    it {should have_many :doctors}
  end
end
