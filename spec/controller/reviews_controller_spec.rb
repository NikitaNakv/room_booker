# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  context "GET index" do
    it "assigns a blank review to the view" do
      get :index
      expect(response).to render_template("index")
    end

    it "assign @reviews" do
      review = Review.create
      get :index
      expect(assigns(:review)).to eq([review])
    end
  end
end
