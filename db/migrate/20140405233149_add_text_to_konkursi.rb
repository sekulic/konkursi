class AddTextToKonkursi < ActiveRecord::Migration
  def change
    add_column :konkursi, :opis, :text
  end
end
