class ReviewsController < ApplicationController

  # GET "restaurants/38/reviews/new"

  ### not needed except if there is a depency with another element (e.g review needs a rating to be created)
  def new
    # find a restaurant instance based on its restaurant id # not only params[:id], need to specify restaurant id
    @restaurant = Restaurant.find(params[:restaurant_id])
    # intitalize a rating
    @review = Review.new
  end

  # POST "restaurants/38/reviews"

  def create
    # build the review with content & rating (see private method)
    @review = Review.new(review_params)
    # find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # associate the review with restaurant instance (e.g: id 5)
    @review.restaurant = @restaurant # or @review.restaurant_id = @restaurant.id
    # save
    if @review.save # if doesn't work, returns false
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity # HTTP 422 error (taken from lecture)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
