# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rooms = Room.first(2)
  end
end
