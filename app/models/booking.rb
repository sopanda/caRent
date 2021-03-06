# frozen_string_literal: true

class Booking < ApplicationRecord
  include AASM

  aasm do
    state :active, initial: true
    state :completed

    event :finish do
      transitions from: :active, to: :completed
    end
  end

  belongs_to :renter, inverse_of: :bookings, class_name: 'User'
  belongs_to :car

  validates :start_date, :end_date, presence: true
  validates_with ::Bookings::DateValidator

  after_save :set_total_price

  def set_total_price
    total_days  = (end_date - start_date).to_i
    car         = Car.find(car_id)

    total_price = car.daily_price * total_days

    update_column('price', total_price) # rubocop:disable Rails/SkipsModelValidations
  end
end
