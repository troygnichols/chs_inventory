class ItemInStock < ActiveRecord::Base
  attr_accessible :item_id, :subject_id, :in_stock
  belongs_to :item
  belongs_to :subject
  validates :in_stock, numericality: :integer
  delegate :name, to: :item
end
