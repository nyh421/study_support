class Public::ExchangedRewardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reward = Reward.find(params[:reward_id])
    @user = User.find(current_user.id)
    if @user.point >= @reward.point
      @exchanged_reward = ExchangedReward.new
      @exchanged_reward.user_id = current_user.id
      @exchanged_reward.reward_id = @reward.id
      @exchanged_reward.content = @reward.content
      @exchanged_reward.save
      #ご褒美とポイントを交換する処理
      @user.point -= @reward.point
      @user.save
      flash[:notice] = "ポイントとご褒美を交換しました。"
      redirect_to new_reward_path
    else
      flash[:alert] = "ポイントが足りません。"
      redirect_to new_reward_path
    end
  end

  def destroy
    exchanged_reward = ExchangedReward.find(params[:id])
    exchanged_reward.destroy
    flash[:notice] = "ご褒美を実行しました。"
    redirect_to new_reward_path
  end

end
