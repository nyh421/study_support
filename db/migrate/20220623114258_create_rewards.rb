class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.float :point, null: false
      t.timestamps
    end
  end
end
