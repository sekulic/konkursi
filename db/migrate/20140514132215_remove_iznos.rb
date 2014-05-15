class RemoveIznos < ActiveRecord::Migration
  def change
    remove_column :konkursi, :iznos
  end
end
