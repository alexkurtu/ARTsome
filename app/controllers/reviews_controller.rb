class ReviewsController < ApplicationController
  # before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @art = Art.find(params[:art_id])
    @user = current_user
    @review.user = @user
    @review.art = @art
    raise
    @review.save!
    redirect_to art_path(@art)
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
