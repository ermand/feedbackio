class Users::BaseController < ::ApplicationController
  before_action :authenticate_user!

  def dashboard
    @is_dashboard = true
    @task = Task.new
  end

end
