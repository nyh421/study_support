class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post_study_method = PostStudyMethod.find(params[:post_study_method_id])
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.post_study_method_id = post_study_method.id
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_study_method = PostStudyMethod.find(params[:post_study_method_id])
    favorite = current_user.favorites.find_by(post_study_method_id: post_study_method.id)
    favorite.destroy
    redirect_to request.referer
  end

  def index
    @favorites = current_user.favorites
  end

end
