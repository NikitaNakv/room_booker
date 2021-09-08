# frozen_string_literal: true

require "rails_helper"

RSpec.describe "BookingsControllers", type: :request do
  context "GET index" do
    it "assigns a blank booking to the view" do
      get :index
      expect(response).to render_template("index")
    end

    it "assign @bookings" do
      booking = Booking.create
      get :index
      expect(assigns(:bookings)).to eq([booking])
    end
  end
end
