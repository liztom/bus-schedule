class AddSlugs < ActiveRecord::Migration
  def change
    add_column :stations, :slug, :string
    add_column :lines, :slug, :string
    add_column :buses, :slug, :string

  end
end
