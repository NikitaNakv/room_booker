# frozen_string_literal: true

class Booking < ApplicationRecord
  has_one :room

  def self.to_csv(status)
    attributes = %w[id name price] # customize columns here
    cars = Booking.where(status: status)

    CSV.generate(headers: true) do |csv|
      csv << attributes

      cars.each do |car|
        csv << attributes.map { |attr| car.send(attr) }
      end
    end
  end

  def self.to_excel
    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "Pie Chart") do |sheet|
        sheet.add_row ["Simple Pie Chart"]
        %w[first second third].each { |label| sheet.add_row [label, rand(1..24)] }
        sheet.add_chart(Axlsx::Pie3DChart, start_at: [0, 5], end_at: [10, 20],
                                           title: "example 3: Pie Chart") do |chart|
          chart.add_series data: sheet["B2:B4"], labels: sheet["A2:A4"],
                           colors: %w[FF0000 00FF00 0000FF]
        end
      end
      p.serialize("simple.xlsx")
    end
  end
end
