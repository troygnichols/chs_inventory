require 'spec_helper'

describe ItemInStock do
  it "must be associated with an item" do
    stock = build :item_in_stock, item: nil
    expect { stock.save! }.to raise_error ActiveRecord::StatementInvalid
  end

  it "must be associated with a location" do
    stock = build :item_in_stock, location: nil
    expect { stock.save! }.to raise_error ActiveRecord::StatementInvalid
  end

  it "requires a quantity value" do
    stock = build :item_in_stock, quantity: nil
    stock.should_not be_valid
    stock.should have(1).error_on(:quantity)
  end

  it "must have a numeric quantity" do
    stock = build :item_in_stock, quantity: 'blah'
    stock.should_not be_valid
    stock.should have(1).error_on(:quantity)
  end

  it "should get the name from the associated item" do
    stock = build :item_in_stock
    stock.name.should match stock.item.name
  end
end
