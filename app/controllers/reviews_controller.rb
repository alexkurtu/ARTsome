class ReviewsController < ApplicationController
  # before_action :set_booking, only: [:new, :create]

  def new
    @art = Art.find(params[:art_id])
    @review = Review.new
  end

  def create
    @art = Art.find(params[:art_id])
    @review = Review.new(review_params)
    @user = current_user
    @review.user = @user
    @review.art = @art
    if @review.save!
      redirect_to art_path(@art), notice: 'Review was successfully created.'
    else
      render 'art/show', status: :unprocessable_entity
    end
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
