class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new

    if params[:back]
      @task = Task.new(tasks_params)
    else
      @task = Task.new
    end
  end

  def confirm
    @task = Task.new(tasks_params)
    render :new if @task.invalid?
  end

  def create
    @task=Task.new(tasks_params)
    If @task.save
      redirect_to tasks_path, notice: "リクエストを作成しました！"
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to tasks_path, notice: "リクエストを編集しました！"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy(tasks_params)
    redirect_to tasks_path, notice: "リクエストを削除しました！"
  end

  private
    def tasks_params
      params.require(:task).permit(:title, :content)
    end

    def set_task
      @task = Task.find(params[:id])
    end
