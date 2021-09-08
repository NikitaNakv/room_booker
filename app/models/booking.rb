# frozen_string_literal: true

require "csv"

class Booking < ApplicationRecord
  acts_as_xlsx
  after_initialize :default_values
  belongs_to :room
  validates :customer_first_name, presence: true
  validates :customer_second_name, presence: true
  validates :date_in, presence: true
  validates :date_out, presence: true

  def to_csv
    CSV.open("#{Time.current}.csv", "a") do |csv|
      csv << [customer_first_name, created_at]
    end
  end

  def to_excel
    Booking.all.to_xlsx
  end

  def default_values
    self.status ||= false
  end
end
