class Users::TasksController < Users::BaseController
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      @task = Task.new
    end
    respond_to do |format|
      format.js
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :note)
    end
end
