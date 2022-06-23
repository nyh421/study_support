class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.float :study_hour, null: false
      t.integer :subject_id, null: false
      t.timestamps
    end
  end
end
