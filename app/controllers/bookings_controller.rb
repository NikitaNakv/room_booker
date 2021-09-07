# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_admin!, only: %i[show index]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:customer_first_name, :customer_second_name, :date_in, date_out)
  end
end