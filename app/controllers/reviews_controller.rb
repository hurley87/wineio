class ReviewsController < ApplicationController
	before_filter :load_wine
  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @wine.reviews.build(review_params)

  	@review.user_id = current_user.id

  	
    respond_to do |format|
      if @review.save
        format.html { redirect_to @wine, notice: 'Review created successfully' }
        format.js {}
      else
        format.html {render 'wines/show', notice: 'There was an error'}
        format.js {}
      end
    end
  end

  def destroy
  	@review = Review.find(params[:id])
    @review.destroy
  end

  private 

  def review_params
  	params.require(:review).permit(:body, :wine_id)
  end

  def load_wine
  	@wine = Wine.find(params[:wine_id])
  end
end
