require "spec_helper"

describe ItemsInStockController do
  describe "routing" do
    it "routes to #new" do
      get("locations/10/items_in_stock/new").should route_to("items_in_stock#new", location_id: "10")
    end

    it "routes to #edit" do
      get("locations/10/items_in_stock/1/edit").should route_to("items_in_stock#edit", location_id: "10", id: "1")
    end

    it "routes to #create" do
      post("locations/10/items_in_stock").should route_to("items_in_stock#create", location_id: "10")
    end

    it "routes to #update" do
      put("locations/10/items_in_stock/1").should route_to("items_in_stock#update", location_id: "10", id: "1")
    end

    it "routes to #destroy" do
      delete("locations/10/items_in_stock/1").should route_to("items_in_stock#destroy", location_id: "10", id: "1")
    end
  end
end
