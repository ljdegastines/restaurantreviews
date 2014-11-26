class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @restaurant.reviews
  end

  def show

  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.create(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
