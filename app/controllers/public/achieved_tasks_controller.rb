class Public::AchievedTasksController < ApplicationController
  before_action :authenticate_user!

  def index
    #トータル、今日、今月の合計勉強時間
    @total_study_time = AchievedTask.where(user_id: current_user.id ).sum(:study_hour)
    @day_study_time = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_day).sum(:study_hour)
    @month_study_time = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_month).sum(:study_hour)
    #トータル、今日、今月の科目毎の勉強記録
    @total_study_record = AchievedTask.where(user_id: current_user.id).group(:subject).order("sum_study_hour DESC").sum(:study_hour)
    @day_study_record = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_day).group(:subject).order("sum_study_hour DESC").sum(:study_hour)
    @month_study_record = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_month).group(:subject).order("sum_study_hour DESC").sum(:study_hour)
  end

  def create
    @task = Task.find(params[:task_id])
    @achieved_task = AchievedTask.new
    @achieved_task.user_id = current_user.id
    @achieved_task.study_hour = @task.study_hour
    @achieved_task.subject = @task.subject.name
    @achieved_task.save
    #タスクを達成するとユーザーのポイントが貯まる処理
    @user = User.find(current_user.id)
    @user.point += @task.study_hour
    @user.save
    @task.destroy
    flash[:notice] = "タスクを達成しました！"
    redirect_to new_task_path
  end

end
