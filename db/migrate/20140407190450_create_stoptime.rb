class CreateStoptime < ActiveRecord::Migration
  def change
    create_table :stoptimes do |t|
      t.time :name
    end

    remove_column :stops, :stoptime
  end
end
