# frozen_string_literal: true

require "rails_helper"

RSpec.describe "HomeControllers", type: :controller do
  context "GET index" do
    subject { get :index }
    it "render index " do
      expect(subject).to render_template("index")
      expect(subject).to render_template(:index)
      expect(subject).to render_template("home/index")
    end
  end
end
