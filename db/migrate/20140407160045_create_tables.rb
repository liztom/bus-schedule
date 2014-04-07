class CreateTables < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name

      t.timestamps
    end
    create_table :lines do |t|
      t.string :name

      t.timestamps
    end
    create_table :buses do |t|
      t.string :name
      t.integer :line_id

      t.timestamps
    end
    create_table :stops do |t|
      t.integer :station_id
      t.integer :line_id
      t.time :stoptime

      t.timestamps
    end
  end
end
