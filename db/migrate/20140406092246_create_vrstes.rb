class CreateVrstes < ActiveRecord::Migration
  def change
    create_table :vrstes do |t|
      t.string :name

      t.timestamps
    end
  end
end
