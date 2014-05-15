class CreateAplikants < ActiveRecord::Migration
  def change
    create_table :aplikants do |t|
      t.string :name

      t.timestamps
    end
  end
end
