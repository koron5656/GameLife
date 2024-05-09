class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :site_id
      t.string :title
      t.text :posted_text
      t.string :tag_list
      t.boolean :release_flag
      t.timestamps
    end
  end
end
