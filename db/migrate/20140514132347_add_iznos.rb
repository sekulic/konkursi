class AddIznos < ActiveRecord::Migration
  def change
    add_column :konkursi, :iznos, :decimal, precision: 30, scale: 2
  end
end
