class TaggedEntity < ActiveRecord::Base
  attr_accessible :tag_id, :entity_id, :entity_type

  belongs_to :tag
  belongs_to :entity, polymorphic: true
end
