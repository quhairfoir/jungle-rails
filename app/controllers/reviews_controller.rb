class ReviewsController < ApplicationController
  # before_action current_user, only:[:create]

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
      # ADD ERRORS HERE
      puts @review.errors.full_messages
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Product deleted!'
  end
end
