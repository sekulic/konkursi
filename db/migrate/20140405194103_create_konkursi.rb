class CreateKonkursi < ActiveRecord::Migration
  def change
    create_table :konkursi do |t|
      t.string :ime
      t.decimal :iznos
      t.date :rok
      t.date :otvaranje

      t.timestamps
    end
  end
end
