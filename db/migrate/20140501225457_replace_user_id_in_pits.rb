class ReplaceUserIdInPits < ActiveRecord::Migration
  def change
    add_column :pits, :user_name, :string
  end
end
