class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit,:update, :destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to root_path,notice:"タスクが保存されました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "タスクを削除しました！"
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :note)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
