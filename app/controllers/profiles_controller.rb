class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    respond_to do |format|
      format.html
      format.json { render json :@profile }
    end
  end

  # def edit
  #   @profile = current_user.build_profile
  # end

  def update
    @profile = current_user.profile
    @profile.update!(profile_params)
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :username)
  end
end