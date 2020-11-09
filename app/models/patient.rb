class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.by_age
    order(age: :desc)
  end
end
