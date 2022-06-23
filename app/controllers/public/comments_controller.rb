class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_study_method = PostStudyMethod.find(params[:post_study_method_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_study_method_id = @post_study_method.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to post_study_method_path(@post_study_method)
    else
      flash[:alert] = "コメントを入力してください。"
      redirect_to post_study_method_path(@post_study_method)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
