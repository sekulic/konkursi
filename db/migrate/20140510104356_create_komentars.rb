class CreateKomentars < ActiveRecord::Migration
  def change
    create_table :komentars do |t|
      t.string :name
      t.integer :pit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
