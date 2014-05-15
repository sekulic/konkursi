class CreatePits < ActiveRecord::Migration
  def change
    create_table :pits do |t|
      t.string :name

      t.timestamps
    end
  end
end
