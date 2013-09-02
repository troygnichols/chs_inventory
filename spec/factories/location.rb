require 'factory_girl'

FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Lab #{('A'..'Z').to_a[n]}" }

    factory :location_with_items_in_stock do
      ignore do
        items_in_stock_count 5
      end

      after :create do |location, evaluator|
        create_list :item_in_stock, evaluator.items_in_stock_count, location: location
      end
    end
  end
end


