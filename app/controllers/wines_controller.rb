class WinesController < ApplicationController
  def index
  	@wines1 = Wine.all
    @wines = Wine.page(params[:page])
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
