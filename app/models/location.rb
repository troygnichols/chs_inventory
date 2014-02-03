# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#

class Location < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :items_in_stock, dependent: :destroy, class_name: 'ItemInStock'

  def to_s
    name
  end
end
