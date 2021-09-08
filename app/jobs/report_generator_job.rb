# frozen_string_literal: true

class ReportGeneratorJob < ApplicationJob
  queue_as :default

  def perform(format)
    bookings = Booking.all
    bookings.each do |booking|
      format == "csv" ? booking.to_csv : booking.to_excel
    end
  end
end
