class CreateRaspisivacs < ActiveRecord::Migration
  def change
    create_table :raspisivacs do |t|
      t.string :name

      t.timestamps
    end
  end
end
