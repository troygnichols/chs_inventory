# == Schema Information
#
# Table name: tags
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    name
  end
end
