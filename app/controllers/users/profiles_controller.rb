class Users::ProfilesController < Users::BaseController
  before_action :find_profile, only: [:show, :edit, :update]

  def show

  end

  def edit

  end

  def update
    if @profile.update(profile_params)
      current_user.profile = @profile
      current_user.save
      AsyncModelMethodCallWorker.perform_async("User", 2, :touch)
      redirect_to @profile, notice: "Profile successfully updated."
    else
      render 'show'
    end

    # respond_to do |format|
    #   format.js
    # end
  end

  private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :picture)
    end
    def find_profile
      @profile = current_user.profile || Profile.new
    end
end
