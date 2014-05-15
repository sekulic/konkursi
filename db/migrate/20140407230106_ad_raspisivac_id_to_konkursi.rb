class AdRaspisivacIdToKonkursi < ActiveRecord::Migration
  def change
    add_column :konkursi, :raspisivac_id, :integer
  end
end
