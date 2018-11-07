class AdvertisementsController < ApplicationController


  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
      @advertisement = Advertisement.new
  end

  def create
   #  @advertisement = Advertisement.new
   #  @advertisement.title = params[:advertisement][:title]
   #  @advertisement.copy = params[:advertisement][:copy]
   #  @advertisement.price = params[:advertisement][:price]
   #
   #  if @advertisement.save
   #    flash[:notice] = "Ad was saved."
   #    redirect_to @advertisement
   #
   #  else
   #    flash[:error] = "Error saving ad. Try again."
   #    render :new
   # 
   # end

  end

#  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:title, :body, :price)
  end

end
