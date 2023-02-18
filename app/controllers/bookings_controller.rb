class BookingsController < ApplicationController
  before_action :authenticate_user!
  def new
    @art = Art.find(params[:art_id])
    @booking = Booking.new
  end

  def create
    @art = Art.find(params[:art_id])
    @booking = Booking.new(bookings_params)
    @booking.art = @art
    @booking.user = current_user
    @booking.value = (@booking.ends_at - @booking.starts_at).to_f * @art.price.to_f
    @booking.status = "Pending approval"
    if @booking.save!
      redirect_to bookings_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
    @review = Review.new
    @arts = Art.all
  end

  def show
    set_booking
    @art = @booking.art

    @markers = [
      {
        lat: @booking.latitude,
        lng: @booking.longitude
      }
    ]
  end

  def update
    set_booking
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:offer_date, :value, :rent_type, :starts_at, :ends_at, :shipping_address)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end


