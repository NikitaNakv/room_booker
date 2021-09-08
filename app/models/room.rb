# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :bookings
  has_one_attached :interior
  validates :room_name, uniqueness: true, presence: true
  validates :desc, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :capacity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
