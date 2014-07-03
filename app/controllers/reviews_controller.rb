class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = @restaurant.reviews.create review_params
    # flash[:notice] = "Your review has been added"

    # display the json formated (as defined in views>create.json.jbuilder) 
    # of the new review
    # render json: @review
    redirect_to '/restaurants' unless request.xhr?
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
