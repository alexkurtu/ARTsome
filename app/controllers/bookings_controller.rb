class BookingsController < ApplicationController
  # before_action :authenticate_user!
  def new
    @art = Art.find(params[:art_id])
    # @art.user = current_user
    @booking = Booking.new
  end

  def create
    @art = Art.find(params[:art_id])
    @booking = Booking.new(bookings_params)
    @booking.art = @art
    @booking.user = current_user

    if booking.save
      redirect_to art_booking_path(@booking), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:offer_date, :price, :rent_type, :start_date, :end_date, :shipping_address)
  end
end
