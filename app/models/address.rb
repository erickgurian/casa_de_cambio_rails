class Address < ApplicationRecord

  has_one :user

  validates :street, :city, :state, :neighbourhood, :postal_code, presence: true

  def city_and_state
    "#{self.city} - #{self.state}"
  end

end
