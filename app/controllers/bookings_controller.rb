class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    set_art
    @booking = Booking.new
  end

  def create
    set_art
    @booking = Booking.new(bookings_params)
    @booking.art = @art
    @booking.user = current_user
    @booking.value = (@booking.ends_at - @booking.starts_at).to_f * @art.price.to_f
    # @markers = [
    #   {
    #     lat: @booking.latitude,
    #     lng: @booking.longitude
    #   }
    # ]
    #
    if @booking.save!
      redirect_to bookings_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
    set_booking
    @art = @booking.art
  end

  def edit
    @booking = Booking.find(params[:id])
    @art = @booking.art
  end

  def update
    set_booking
    @art = @booking.art
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to bookings_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:value, :rent_type, :starts_at, :ends_at, :shipping_address)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_art
    @art = Art.find(params[:art_id])
  end

end
