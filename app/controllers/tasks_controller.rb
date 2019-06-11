class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit,:update, :destroy]

  def index
    if params[:sort_priority]
      @tasks = Task.order(priority: :asc)
    elsif params[:sort_expired]
      # @tasks = Task.order(deadline: :asc)
      @tasks = Task.expired
    elsif params[:task] == nil
      # @tasks = Task.order(created_at: :desc)
      @tasks = Task.latest
    elsif params[:task][:search]
      # @tasks = Task.where('task_name LIKE ? AND status LIKE ?', "%#{params[:task][:task_name_key]}%", "%#{params[:task][:status_key]}%")
      # @tasks = Task.search(params[:task][:task_name_key],params[:task][:status_key])
      @tasks = Task.search(params)
    # else
    #   @tasks = Task.all.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
      redirect_to root_path, notice: "タスクを編集しました！"
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
    params.require(:task).permit(:task_name, :note, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
