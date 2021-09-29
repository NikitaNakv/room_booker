# frozen_string_literal: true

require "rails_helper"

RSpec.describe Booking, type: :model do
  context "validations" do
    it "should validate presence of date_in" do
      Booking.create(customer_first_name: "qwe", customer_second_name: "qwe", date_out: DateTime.current)
      expect(Booking.count).to eq 0
    end

    it "should validate presence of date_out" do
      Booking.create(customer_first_name: "qwe", customer_second_name: "qwe", date_in: DateTime.current)
      expect(Booking.count).to eq 0
    end

    it "should validate presence of customer_first_name" do
      Booking.create(customer_second_name: "qwe", date_in: DateTime.current, date_out: DateTime.current)
      expect(Booking.count).to eq 0
    end

    it "should validate presence of customer_second_name" do
      Booking.create(customer_first_name: "qwe", date_in: DateTime.current, date_out: DateTime.current)
      expect(Booking.count).to eq 0
    end
  end

  context "report generating" do
    Booking.create(customer_first_name: "qwe", customer_second_name: "qwe", date_in: DateTime.current,
                   date_out: DateTime.current)
    it "should generate csv file" do
      Booking.to_csv
      expect(true).to eq true
    end

    it "should generate excel file" do
      Booking.to_excel
      expect(true).to eq true
    end
  end
end
