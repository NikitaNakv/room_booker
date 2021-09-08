# frozen_string_literal: true

require "rails_helper"

RSpec.describe Booking, type: :model do
  context "validations" do
    it { should validate_presence_of :customer_first_name }
    it { should validate_presence_of :customer_second_name }
    it { should validate_presence_of :date_in }
    it { should validate_presence_of :date_out }
  end
end
