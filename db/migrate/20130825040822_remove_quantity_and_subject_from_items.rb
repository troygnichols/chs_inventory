class RemoveQuantityAndSubjectFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :quantity
    remove_column :items, :subject
  end

  def down
    add_column :items, :quantity, :integer
    add_column :items, :subject, :string
  end
end
