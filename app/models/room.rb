# frozen_string_literal: true

class Room < ApplicationRecord
  has_one_attached :interior
  validates :room_name, uniqueness: true
end
