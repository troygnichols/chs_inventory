class Item < ActiveRecord::Base
  attr_accessible :name, :size, :units

  DEFAULT_UNITS = %w(mL L mm inches)

  # I can't believe rails doesn't respect my custom inflector; I'm going to file a bug!!!
  has_many :items_in_stock, dependent: :destroy, class_name: 'ItemInStock'

  default_scope order(:name)

  def name_and_info
    info = name
    info << " #{size}" if size
    info << " #{units}" if units
  end
end
