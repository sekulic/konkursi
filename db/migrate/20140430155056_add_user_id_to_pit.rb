class AddUserIdToPit < ActiveRecord::Migration
  def change
    add_column :pits, :user_id, :integer
  end
end
