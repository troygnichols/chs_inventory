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
  belongs_to :tag
  belongs_to :entity, polymorphic: true
end
