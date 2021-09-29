# frozen_string_literal: true

class ReportGeneratorJob < ApplicationJob
  queue_as :default

  def perform(format)
    format == "csv" ? Booking.to_csv : Booking.to_excel
  end
end
