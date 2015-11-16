class VersionsController < ApplicationController
  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :bacl, notice: "Undid #{@version.event}"
  end
end
