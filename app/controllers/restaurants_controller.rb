class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def edit; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(task_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(task_params)
      redirect_to task_path(@task)
    else
      # give the form back again -> edit.html.erb
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
    raise
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def task_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
