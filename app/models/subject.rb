class Subject < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, uniqueness: { case_sensitive: false }
  has_many :items_in_stock, dependent: :destroy, class_name: 'ItemInStock'

  def to_s
    name
  end
end
