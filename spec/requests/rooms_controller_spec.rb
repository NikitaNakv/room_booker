# frozen_string_literal: true

require "rails_helper"

RSpec.describe "RoomsControllers", type: :controller do
  context "GET index" do
    it "assigns a blank room to the view" do
      get :index
      expect(response).to render_template("index")
    end

    it "assign @rooms" do
      room = Room.create
      get :index
      expect(assigns(:rooms)).to eq([room])
    end
  end
end
