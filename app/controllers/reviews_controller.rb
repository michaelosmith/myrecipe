class ReviewsController < ApplicationController
  
  before_action :require_user, except: [:show]
  
  def new
    @review = Review.new
    @recipe = Recipe.find(params[:id])
    @chef = Chef.find(current_user.id)
    #binding.pry
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.create(review_params)
    @review.chef = current_user
    if @review.save
      flash[:success] = "Thank your for your review."
      redirect_to @recipe
    else
      flash[:danger] = "An error occured"
      redirect_to @recipe
    end
  end
  
  
  
  private
  
    def review_params
      params.require(:review).permit(:body, :recipe_id)
    end
  
end