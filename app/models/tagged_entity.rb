# == Schema Information
#
# Table name: tagged_entities
#
#  id          :integer          not null, primary key
#  tag_id      :integer          not null
#  entity_id   :integer          not null
#  entity_type :string(255)      not null
#

class TaggedEntity < ActiveRecord::Base
  attr_accessible :tag_id, :entity_id, :entity_type

  belongs_to :tag
  belongs_to :entity, polymorphic: true
end
