class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.integer :quantity
      t.string :subject

      t.timestamps
    end
  end
end
