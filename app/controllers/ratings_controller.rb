class RatingsController < ApplicationController

  def create
    @rating = Rating.new(
      rating: params[:rating][:rating],
      description: params[:rating][:description],
      user_id: current_user[:id],
      product_id: params[:product_id]
    )
    if @rating.save
      redirect_to product_path(params[:product_id])
    else
      # ADD ERRORS HERE
      puts @rating.errors.full_messages
    end
  end
end
