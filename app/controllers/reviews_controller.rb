class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @reviews = Review.all
  end

  def show; end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
