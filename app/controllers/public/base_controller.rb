class Public::BaseController < ::ApplicationController
  def dashboard
    if user_signed_in?
      redirect_to :dashboard
    end
  end
end
