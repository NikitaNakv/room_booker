# frozen_string_literal: true

require "csv"

class Booking < ApplicationRecord
  after_initialize :default_values
  belongs_to :room
  validates :customer_first_name, presence: true
  validates :customer_second_name, presence: true
  validates :date_in, presence: true
  validates :date_out, presence: true

  scope :accepted?, lambda { |status|
    where("status = ?", status)
  }

  def self.to_csv
    bookings = Booking.all
    filename = "bookings-#{DateTime.current}.csv"
    CSV.open("reports/#{filename}", "a") do |csv|
      bookings.each do |booking|
        csv << [booking.customer_first_name, booking.created_at]
      end
    end
    report = Report.create(name: filename, format: "excel")
    report.file.attach(io: File.open("reports/#{filename}"), filename: filename, content_type: "text/csv")
    report.save
  end

  def self.to_excel
    p = Axlsx::Package.new
    wb = p.workbook
    wb.add_worksheet(name: "Bookings") do |sheet|
      sheet.add_row %w[customer_first_name customer_second_name room_name date_in date_out created_at]
      bookings = Booking.all
      bookings.each do |booking|
        sheet.add_row [booking.customer_first_name, booking.customer_second_name,
                       Room.find_by(id: booking.room_id).room_name, booking.date_in, booking.date_out, booking.created_at]
      end
    end
    filename = "bookings-#{DateTime.current}.xlsx"
    p.serialize "reports/#{filename}"
    report = Report.create(name: filename, format: "excel")
    report.file.attach(io: File.open("reports/#{filename}"), filename: filename,
                       content_type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    report.save
  end

  def default_values
    self.status ||= false
  end
end
