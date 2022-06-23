class CreatePostStudyMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :post_study_methods do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
