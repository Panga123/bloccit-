
class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:title, :body, :price)
  end

end
