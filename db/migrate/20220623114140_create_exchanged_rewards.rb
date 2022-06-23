class CreateExchangedRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanged_rewards do |t|
      t.integer :user_id, null: false
      t.integer :reward_id, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
