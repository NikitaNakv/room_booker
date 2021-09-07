# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new show create]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :capacity, :price, :interior)
  end
end
