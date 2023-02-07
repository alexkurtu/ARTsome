class ArtsController < ApplicationController
  def index
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @user = current_user
    @art.user = @user
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
    params.require(:art).permit(:title, :category, :description, :artist, :year, :current_location, photos: [])
  end
end
