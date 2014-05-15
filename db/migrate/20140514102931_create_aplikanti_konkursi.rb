class CreateAplikantiKonkursi < ActiveRecord::Migration
  def change
    create_table :aplikant_konkursi do |t|
      t.integer :aplikant_id
      t.integer :konkurs_id

      t.timestamps

    end
  end
end
