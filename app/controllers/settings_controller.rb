class SettingsController < ApplicationController
  def setting
    @user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def set
    @user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def done
  @user ||= User.find_by(id: cookies.signed[:user_id])
  @user.current_mass = params[:mass]
  @user.allow_the_publication = params[:atp]
  if params[:image] != nil then
    @user.image = params[:image]
  end
  @user.save!
  redirect_to set_url
  end

  private

  def user_params
    params.require(:user).permit(:mass, :atp)
  end
end
