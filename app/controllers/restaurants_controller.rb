class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new # get function
    @restaurant = Restaurant.new
  end

  def create # post function
    # Restaurant.create(params[:name]) - no longer allowed in Rails 4 due to
    # security risk
    @restaurant = Restaurant.create restaurant_params

    if @restaurant.save
      redirect_to '/restaurants'
    else
      render 'new'
    end

  end

  def edit # get function
    @restaurant = Restaurant.find params[:id]
    # .find (ActiveRecord) is the same as .get in DataMapper
  end

  def update # post function
    @restaurant = Restaurant.find params[:id]
    @restaurant.update restaurant_params
    # this would work: @restaurant.update {name: "Kentucky Fried Chicken"}
    # since params are sent via hashes
    # can check this by trying to raise an error: raise "hello"

    # in console log, would be able to do:
    # @restaurant = Restaurant.first
    # @restaurant.update(name: "kentucky fried chicken")
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    flash[:notice] = "Successfully deleted #{@restaurant.name}"
    redirect_to '/restaurants'
  end

  private 

  def restaurant_params
    #explicitly allow this input field to be submitted
    params.require(:restaurant).permit(:name, :cuisine)
    # or params[:restaurant].permit(:name, :cuisine)
  end
end
