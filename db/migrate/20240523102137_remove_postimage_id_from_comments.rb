class RemovePostimageIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :postimage_id, :integer
  end
end
