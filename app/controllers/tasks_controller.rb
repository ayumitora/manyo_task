class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_priority]
      # @tasks = Task.order(priority: :asc)
      @tasks = current_user.tasks.important
    elsif params[:sort_expired]
      # @tasks = Task.order(deadline: :asc)
      @tasks = current_user.tasks.expired
    elsif params[:task] == nil
      # @tasks = Task.order(created_at: :desc)
      @tasks = current_user.tasks.latest
    elsif params[:task][:search]
      @tasks = current_user.tasks.search(params)
      # @tasks = Task.where('task_name LIKE ? AND status LIKE ?', "%#{params[:task][:task_name_key]}%", "%#{params[:task][:status_key]}%")
      # @tasks = Task.search(params[:task][:task_name_key],params[:task][:status_key])
      if params[:task][:which_label_ids].present?
        label = LabelTag.where(label_id: params[:task][:which_label_ids]).pluck(:task_id)
        @tasks = current_user.tasks.search(params)
        @tasks = @tasks.where(id: label)
      end
    end
    @tasks = @tasks.page(params[:page]).per(7)
  end

  def new
    @task = Task.new
    @labels = Label.all
    # @task.label_tags.build
  end

  def create
    @task = current_user.tasks.new(task_params)
    # label_note = LabelTag.new(label_params)
    # @task.label_tags = label_tags(label_ids: label_note)
    if @task.save # 親要素を保存かけてあげることで自動で子要素も保存されます！
      redirect_to root_path, notice: "タスクが保存されました！"
    else
      render 'new'
    end
    # binding.pr
    # @label_tags = LabelTag.create(label_id:(params[:label_tags]), task_id: @task.id)
  end

  def show
  end

  def edit
    @labels = Label.all
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
    params.require(:task).permit(
      :task_name,
      :note,
      :deadline,
      :status,
      :priority,
      which_label_ids: []
    )
  end


  def set_task
    @task = Task.find(params[:id])
  end
end
