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

  def method_time(wine)
    @wines = Wine.where(wine_type: wine)

    respond_to do |format|
      format.html 
      format.js {}
    end
  end

  def red 
    method_time('Red Wine')
  end

  def white
    method_time('White Wine')
  end

  def speciality
    method_time('Specialty Wines')
  end

  def sparkling
    method_time('Sparkling Wine')
  end

  def fortified
    method_time('Fortified Wines')
  end
end
