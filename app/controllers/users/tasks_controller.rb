class Users::TasksController < Users::BaseController
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        @task = Task.new
      end
      format.js
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :note)
    end
end
