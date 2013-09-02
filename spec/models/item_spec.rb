require 'spec_helper'

describe Item do
  it 'allows duplicate names' do
    existing_item = FactoryGirl.create :item
    new_item = FactoryGirl.build_stubbed :item, name: existing_item.name
    assert new_item.valid?, new_item.errors.full_messages.to_sentence
  end

  it 'destroys related ItemsInStock when destroyed' do
    item = FactoryGirl.create :item
    location = FactoryGirl.create :location
    FactoryGirl.create :item_in_stock, location_id: location.id, item_id: item.id, quantity: 42
    assert_no_difference 'Location.count' do
      assert_difference 'ItemInStock.count', -1 do
        assert_difference 'Item.count', -1 do
          item.destroy
        end
      end
    end
  end
end
