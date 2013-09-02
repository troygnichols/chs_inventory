class ItemInStock < ActiveRecord::Base
  attr_accessible :item_id, :subject_id, :quantity
  belongs_to :item
  belongs_to :location
  validates :quantity, numericality: :integer
  delegate :name, to: :item
end
