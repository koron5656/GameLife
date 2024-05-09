class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.integer :email
      t.string :password
      t.timestamps
    end
  end
end
