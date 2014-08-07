class WinesController < ApplicationController
  def index
    @wines = Wine.order('created_at DESC').page(params[:page])
  	@wines1 = Wine.all
    
    respond_to do |format|
        format.html
        format.json { render json: @wines1}
    end
  end

  def show
  	@wine = Wine.find(params[:id])

  	if current_user
  		@review = @wine.reviews.build
  		@rating = @wine.ratings.build
  	end
  end
end
