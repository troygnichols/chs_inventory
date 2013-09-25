class CreateTaggedEntities < ActiveRecord::Migration
  def up
    create_table :tagged_entities do |t|
      t.integer :tag_id, null: false
      t.integer :entity_id, null: false
      t.string :entity_type, null: false
    end
  end

  def down
    drop_table :tagged_entities
  end
end
