class ArtsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index

  def index
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
    @booking = Booking.new
    @starts_at = params['starts_at']
    @ends_at = params['ends_at']
    if !@start_date.blank? && !@end_date.blank?
      from = @starts_at.split("/")
      to = @ends_at.split("/")
      start = Date.new(from[2].to_f, from[1].to_f - 1, from[0].to_f)
      finish = Date.new(to[2].to_f, to[1].to_f - 1, to[0].to_f)
      @total_days = (finish - start).to_f
      @total_price = (@total_days * @booking.value.to_f).round
    end

    # bookiongs = Bookings.all.map do booking =>
    # @art = Art.find(params[:art_id])
    # @bookings = @art.bookings
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user
    if @art.save
      redirect_to arts_path(@art)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])

    if @art.user == current_user
      @art.update(art_params)
      redirect_to arts_path(@art)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to arts_path, status: :see_other
  end

  private

  def art_params
    params.require(:art).permit(:title, :category, :price, :description, :artist, :year, :current_location, photos: [])
  end
end
