class CreateSektoriKonkursi < ActiveRecord::Migration
  def change
    create_table :sektori_konkursi do |t|
      t.integer :sektori_id
      t.integer :konkurs_id

      t.timestamps
    end
  end
end
