class CreateAchievedTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :achieved_tasks do |t|
      t.integer :user_id, null: false
      t.float :study_hour, null: false
      t.string :subject, null: false
      t.timestamps
    end
  end
end
