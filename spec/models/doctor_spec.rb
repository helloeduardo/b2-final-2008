require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Relationships' do
    it {should belong_to :hospital}
    it {should have_many :appointments}
    it {should have_many(:patients).through(:appointments)}
  end
end
