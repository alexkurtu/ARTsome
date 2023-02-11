class BookingsController < ApplicationController
  # before_action :authenticate_user!
  def new
    @art = Art.find(params[:art_id])
    @booking = Booking.new
  end

  def create
    @art = Art.find(params[:art_id])
    @booking = Booking.new(bookings_params)
    @booking.art = @art
    @booking.user = current_user
    @booking.status = "Pending host validation"
    if @booking.ends_at && @booking.starts_at
      @booking.value = (booking.ends_at - @booking.starts_at).to_f * @booking.art.price.to_f
    else
      @booking.value = 0
    end
    if booking.save
      redirect_to art_booking_path(@booking), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @review = Review.new
  end

  def show
    set_booking
    @art = @booking.art
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
