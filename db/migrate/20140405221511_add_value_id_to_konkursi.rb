class AddValueIdToKonkursi < ActiveRecord::Migration
  def change
    add_column :konkursi, :valuta_id, :integer
  end
end
