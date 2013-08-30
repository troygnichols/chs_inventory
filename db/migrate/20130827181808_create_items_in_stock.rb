class CreateItemsInStock < ActiveRecord::Migration
  def up
    create_table :items_in_stock do |t|
      t.references :subject, null: false
      t.references :item, null: false
      t.integer :quantity, null: false
    end
  end

  def down
    drop_table :items_in_stock
  end
end
