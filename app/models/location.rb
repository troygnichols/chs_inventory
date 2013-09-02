class Location < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :items_in_stock, dependent: :destroy, class_name: 'ItemInStock'

  def to_s
    name
  end
end
