class ArtsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    if params[:query].present?
      @arts = Art.search_by_title_artist_year(params[:query])
    else
      @arts = Art.all
    end
  end

  def show
    @art = Art.find(params[:id])
    @booking = Booking.new
    @art.user = current_user
    

    # bookings = Bookings.all.map do booking =>
    # @art = Art.find(params[:art_id])
    # @bookings = @art.bookings
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user
    if @art.save!
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
