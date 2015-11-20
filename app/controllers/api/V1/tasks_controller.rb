class Api::V1::TasksController < Api::BaseController
  before_action :find_task, only: [:show]

  def index
    render json: current_user.tasks
  end

  def show
    render json: @task
  end

  private

    def find_task
      @task = current_user.tasks.find(params[:id])
    end
end
