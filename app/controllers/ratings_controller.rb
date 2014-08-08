class RatingsController < ApplicationController
	before_filter :load_wine

	def show 
		@rating = Rating.find(params[:id])
	end

  def create
  	@rating = @wine.ratings.build(ratings_params)
  	@rating.user = current_user

    respond_to do |format|
      if @rating.save
        @wine.average_rating
        format.html { redirect_to @wine, :notice => "Your rating has been saved!" }
        format.js {}
      else
        format.html {render 'wines/show', :notcie => 'There was an error'}
        format.js {}
      end
    end
  end

  private

  def load_wine
  	@wine = Wine.find(params[:wine_id])
  end

  def ratings_params
  	params.require(:rating).permit(:wine_id, :stars)
  end
end
