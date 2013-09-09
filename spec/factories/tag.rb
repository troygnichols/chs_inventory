require 'factory_girl'

FactoryGirl.define do
  factory :tag do
    name { ['Glassware', 'Acid', 'Base', 'Electronics'].sample }
  end
end

