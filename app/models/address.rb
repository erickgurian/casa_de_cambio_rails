class Address < ApplicationRecord

  belongs_to :user

  validates :street, :city, :state, :neighbourhood, :postal_code, presence: true

  def city_and_state
    "#{self.city} - #{self.state}"
  end

end
