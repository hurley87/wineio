class ReviewsController < ApplicationController
	before_filter :load_wine
  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @wine.reviews.build(review_params)

  	@review.user_id = current_user.id

  	if @review.save
      redirect_to @wine, notice: 'Review created successfully'
    else
      render 'wines/show'
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
