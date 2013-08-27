class AddUnitsItems < ActiveRecord::Migration
  def up
    add_column :items, :units, :string
  end

  def down
    remove_column :items, :units
  end
end
