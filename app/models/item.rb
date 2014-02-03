# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  size       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  units      :string(255)
#

class Item < ActiveRecord::Base
  validate :only_one_tag

  DEFAULT_UNITS = %w(mL L mm inches)

  # I can't believe rails doesn't respect my custom inflector; I'm going to file a bug!!!
  has_many :items_in_stock, dependent: :destroy, class_name: 'ItemInStock'
  has_many :tagged_entities, as: :entity
  has_many :tags, through: :tagged_entities

  default_scope order(:name)

  def tag
    tags.first
  end

  def name_and_info
    info = name
    info << " #{size}" if size
    info << " #{units}" if units
  end

  def only_one_tag
    errors[:tags] << "There can only be one category!" if tags.count > 1
  end
end
