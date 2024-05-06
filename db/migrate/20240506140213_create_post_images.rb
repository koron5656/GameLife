class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.text :comment
      t.integer :user_id
      t.integer :post_image_id
      t.timestamps
    end
  end
end
