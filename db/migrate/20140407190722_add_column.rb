class AddColumn < ActiveRecord::Migration
  def change
    add_column :stoptimes, :stop_id, :int
  end
end
