class AdStatusIdToKonkursi < ActiveRecord::Migration
  def change
    add_column :konkursi, :status_id, :integer
  end
end
