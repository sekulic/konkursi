class RemoveColumnUserNameFromPit < ActiveRecord::Migration
  def change
    remove_column :pits, :user_name
  end
end
