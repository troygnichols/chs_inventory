require 'spec_helper'

describe Item do
  it 'allows duplicate names' do
    existing_item = FactoryGirl.create :item
    new_item = FactoryGirl.build_stubbed :item, name: existing_item.name
    assert new_item.valid?, new_item.errors.full_messages.to_sentence
  end

  it 'destroys related ItemsInStock when destroyed' do
    item = FactoryGirl.create :item
    subject = FactoryGirl.create :subject
    FactoryGirl.create :item_in_stock, subject_id: subject.id, item_id: item.id, in_stock: 42
    assert_no_difference 'Subject.count' do
      assert_difference 'ItemInStock.count', -1 do
        assert_difference 'Item.count', -1 do
          item.destroy
        end
      end
    end
  end
end
