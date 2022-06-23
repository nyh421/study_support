class Public::SubjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @subject = Subject.new
    @subjects = current_user.subjects
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    if @subject.save
      flash[:notice] = "科目を追加しました。"
      redirect_to new_subject_path
    else
      flash[:alert] = "科目名を設定してください。"
      @subjects = current_user.subjects
      redirect_to new_subject_path
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    if @subject.user != current_user
      redirect_to new_subject_path
    end
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:notice] = "科目を編集しました。"
      redirect_to new_subject_path
    else
      flash[:alert] = "科目名を設定してください。"
      redirect_to request.referer
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "科目を削除しました。"
    redirect_to new_subject_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
