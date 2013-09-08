# == Schema Information
#
# Table name: items_in_stock
#
#  id          :integer          not null, primary key
#  location_id :integer          not null
#  item_id     :integer          not null
#  quantity    :integer          not null
#

class ItemInStock < ActiveRecord::Base
  attr_accessible :item_id, :subject_id, :quantity
  belongs_to :item
  belongs_to :location
  validates :quantity, numericality: :integer
  delegate :name, to: :item
end
