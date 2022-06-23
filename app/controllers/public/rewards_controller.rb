class Public::RewardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reward = Reward.new
    @rewards = Reward.where(user_id: current_user.id)
    @exchanged_reward = ExchangedReward.where(user_id: current_user.id)
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.user_id = current_user.id
    if @reward.save
      flash[:notice] = "ご褒美を設定しました。"
      redirect_to new_reward_path
    else
      flash[:alert] = "ご褒美の内容を入力してください。"
      redirect_to new_reward_path
    end
  end

  def edit
    @reward = Reward.find(params[:id])
    if @reward.user != current_user
      redirect_to new_reward_path
    end
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      flash[:notice] = "ご褒美を編集しました。"
      redirect_to new_reward_path
    else
      flash[:alert] = "ご褒美の内容を入力してください。"
      redirect_to request.referer
    end
  end

  def destroy
    reward = Reward.find(params[:id])
    reward.destroy
    flash[:notice] = "ご褒美を削除しました。"
    redirect_to new_reward_path
  end

  private

  def reward_params
    params.require(:reward).permit(:content, :point)
  end

end
