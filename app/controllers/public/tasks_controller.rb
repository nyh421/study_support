class Public::TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
    #ユーザーの総勉強時間
    @total_study_time = AchievedTask.where(user_id: current_user.id).sum(:study_hour)
    @todays_total_study_time = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_day).sum(:study_hour)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = "タスクを追加しました。"
      redirect_to new_task_path
    else
      flash[:alert] = "科目もしくはタスクを設定してください。"
      redirect_to new_task_path
    end
  end

  def edit
    @task = Task.find(params[:id])
    if @task.user != current_user
      redirect_to new_task_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "タスクを編集しました。"
      redirect_to new_task_path
    else
      flash[:alert] = "タスクもしくは科目を設定してください。"
      redirect_to request.referer
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:notice] = "タスクを削除しました。"
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:content, :study_hour, :subject_id)
  end

end
