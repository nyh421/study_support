class Admin::PostStudyMethodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_study_methods = PostStudyMethod.all
  end

  def show
    @post_study_method = PostStudyMethod.find(params[:id])
  end

  def search
    @word = params[:word]
    @post_study_methods = PostStudyMethod.search_for(@word)
    render :index
  end

  def destroy
    post_study_method = PostStudyMethod.find(params[:id])
    post_study_method.destroy
    redirect_to admin_post_study_methods_path
  end

end
