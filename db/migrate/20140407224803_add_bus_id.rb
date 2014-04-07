class AddBusId < ActiveRecord::Migration
  def change
    add_column :stoptimes, :bus_id, :int
  end
end
