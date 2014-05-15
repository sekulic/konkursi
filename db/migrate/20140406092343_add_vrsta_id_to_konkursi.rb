class AddVrstaIdToKonkursi < ActiveRecord::Migration
  def change
    add_column :konkursi, :vrsta_id, :integer
  end
end
