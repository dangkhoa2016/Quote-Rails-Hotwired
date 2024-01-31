class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_user.assign_attributes(user_params)
    if current_user.save
      flash[:notice] = 'Profile updated successfully'
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
