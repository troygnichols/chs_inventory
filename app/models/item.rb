class Item < ActiveRecord::Base
  attr_accessible :name, :quantity, :size, :subject
end
