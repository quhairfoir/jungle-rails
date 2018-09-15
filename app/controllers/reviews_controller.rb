class ReviewsController < ApplicationController
  before_action :require_current_user

  def create
    @review = Review.new(
      rating: params[:review][:rating],
      description: params[:review][:description],
      user_id: current_user[:id],
      product_id: params[:product_id]
    )
    if @review.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to :back, flash: { error: @review.errors.full_messages.first } 
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Product deleted!'
  end

  private
  def require_current_user
    unless current_user
      flash[:error] = "You must be logged in to make a review"
    redirect_to '/login'
    end
  end
end
