require 'factory_girl'

FactoryGirl.define do
  factory :item_in_stock do
    association :item, factory: :item, strategy: :build
    association :location, factory: :location, strategy: :build
    quantity { Random.rand(100) }
  end
end


