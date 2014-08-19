require "spec_helper"

describe ItemsInStockController, :type => :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get("locations/10/items_in_stock/new")).to route_to("items_in_stock#new", location_id: "10")
    end

    it "routes to #edit" do
      expect(get("locations/10/items_in_stock/1/edit")).to route_to("items_in_stock#edit", location_id: "10", id: "1")
    end

    it "routes to #create" do
      expect(post("locations/10/items_in_stock")).to route_to("items_in_stock#create", location_id: "10")
    end

    it "routes to #update" do
      expect(put("locations/10/items_in_stock/1")).to route_to("items_in_stock#update", location_id: "10", id: "1")
    end

    it "routes to #destroy" do
      expect(delete("locations/10/items_in_stock/1")).to route_to("items_in_stock#destroy", location_id: "10", id: "1")
    end
  end
end
