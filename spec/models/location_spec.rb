require 'spec_helper'

describe Location, :type => :model do
  it "must have a name" do
    location = build :location, name: ''
    location.valid?
    expect(location.errors[:name].size).to eq(1)
  end

  it "must have a unique name" do
    create :location, name: 'Secret Lab'
    location = build :location, name: 'secret lab'
    location.valid?
    expect(location.errors[:name].size).to eq(1)
  end

  it "should destroy associated ItemsInStock" do
    location = create :location_with_items_in_stock, items_in_stock_count: 2
    assert_difference lambda { ItemInStock.count }, -(location.items_in_stock.count) do
      location.destroy
    end
  end
end
