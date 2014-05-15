class CreateSektoris < ActiveRecord::Migration
  def change
    create_table :sektoris do |t|
      t.string :name

      t.timestamps
    end
  end
end
