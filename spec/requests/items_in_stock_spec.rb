require 'spec_helper'

include Warden::Test::Helpers

describe "ItemInStocks", :type => :request do
  describe "not logged in" do
    describe "GET /locations/:location_id/items_in_stock/new" do
      it "should redirect to sign_in page" do
        get new_location_item_in_stock_path(1)
        expect(response).to deny_access
      end
    end

    describe "GET /locations/:location_id/items_in_stock/:id/edit" do
      it "should redirect to sign_in page" do
        get edit_location_item_in_stock_path(1, 1)
        expect(response).to deny_access
      end
    end

    describe "POST /locations/:location_id/items_in_stock" do
      it "should redirect to sign_in page" do
        post location_items_in_stock_path(1)
        expect(response).to deny_access
      end
    end

    describe "PUT /locations/:location_id/items_in_stock/:id" do
      it "should redirect to sign_in page" do
        put location_item_in_stock_path(1, 1)
        expect(response).to deny_access
      end
    end

    describe "DELETE /locations/:location_id/items_in_stock/:id" do
      it "should redirect to sign_in page" do
        delete location_item_in_stock_path(1, 1)
        expect(response).to deny_access
      end
    end
  end

  describe "logged in" do
    before :all do
      @user = create :user
      @location = create :location_with_items_in_stock
      @item_in_stock = @location.items_in_stock.first!
      @item = @item_in_stock.item
    end

    before :each do
      login_as @user
    end

    describe "GET /locations/:location_id/items_in_stock/new" do
      it "should render new page" do
        get new_location_item_in_stock_path(@location)
        expect(response).to render_template 'items_in_stock/new'
      end
    end

    describe "GET /locations/:location_id/items_in_stock/:id/edit" do
      it "should render edit page" do
        get edit_location_item_in_stock_path(@location, @item_in_stock)
        expect(response).to render_template 'items_in_stock/edit'
      end
    end

    describe "POST /locations/:location_id/items_in_stock" do
      it "should create and redirect to location show page" do
        post location_items_in_stock_path(@location), item_in_stock: attributes_for(:item_in_stock).merge(item_id: @item.id)
        expect(response).to redirect_to location_path(@location)
      end
    end

    describe "PUT /locations/:location_id/items_in_stock/:id" do
      it "should update and redirect to location show page" do
        put location_item_in_stock_path(@location, @item_in_stock), item_in_stock: { quantity: '1000' }
        expect(response).to redirect_to location_path(@location)
        expect(assigns(:item_in_stock).reload.quantity).to equal 1000
      end
    end

    describe "DELETE /locations/:location_id/items_in_stock/:id" do
      it "should delete and redirect to location show page" do
        item_in_stock = create :item_in_stock, location: @location
        delete location_item_in_stock_path(@location, item_in_stock)
        expect(response).to redirect_to location_path(@location)
        expect(assigns(:item_in_stock)).to be_destroyed
      end
    end
  end
end
