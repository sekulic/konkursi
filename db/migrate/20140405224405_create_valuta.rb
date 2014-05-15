class CreateValuta < ActiveRecord::Migration
  def change
    create_table :valuta do |t|
      t.string :name

      t.timestamps
    end
  end
end
