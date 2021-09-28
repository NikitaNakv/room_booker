# frozen_string_literal: true

require "rails_helper"

RSpec.describe BookingsController, type: :controller do
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

  context "POST create" do
    it "assigns a blank booking to the view" do
      Room.create(room_name: "cool room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      post :create, :params => { :booking => { :customer_first_name => "qwe", :room_name => "cool room",
                                               :customer_second_name => "qwe",
                                               :date_in => DateTime.current, :date_out => DateTime.current }}
      expect(response).to render_template("show")
    end
  end
end
