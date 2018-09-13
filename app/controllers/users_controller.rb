class UsersController < ApplicationController

  def show 
    # TO DO -- pass current_user to this route in order to display user info
    # @user = User.find_by_id(params[:id])
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :products
    else
      render 'new'
    end
  end

private 
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
