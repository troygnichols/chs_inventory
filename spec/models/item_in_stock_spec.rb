require 'spec_helper'

describe ItemInStock, :type => :model do
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
    expect(stock).not_to be_valid
    expect(stock.errors[:quantity].size).to eq(1)
  end

  it "must have a numeric quantity" do
    stock = build :item_in_stock, quantity: 'blah'
    expect(stock).not_to be_valid
    expect(stock.errors[:quantity].size).to eq(1)
  end

  it "should get the name from the associated item" do
    stock = build :item_in_stock
    expect(stock.name).to match stock.item.name
  end
end
