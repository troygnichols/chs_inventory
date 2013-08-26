require "spec_helper"

describe ItemsInStockController do
  describe "routing" do
    it "routes to #index" do
      get("subjects/10/items_in_stock").should route_to("items_in_stock#index", subject_id: "10")
    end

    it "routes to #new" do
      get("subjects/10/items_in_stock/new").should route_to("items_in_stock#new", subject_id: "10")
    end

    it "routes to #show" do
      get("subjects/10/items_in_stock/1").should route_to("items_in_stock#show", subject_id: "10", id: "1")
    end

    it "routes to #edit" do
      get("subjects/10/items_in_stock/1/edit").should route_to("items_in_stock#edit", subject_id: "10", id: "1")
    end

    it "routes to #create" do
      post("subjects/10/items_in_stock").should route_to("items_in_stock#create", subject_id: "10")
    end

    it "routes to #update" do
      put("subjects/10/items_in_stock/1").should route_to("items_in_stock#update", subject_id: "10", id: "1")
    end

    it "routes to #destroy" do
      delete("subjects/10/items_in_stock/1").should route_to("items_in_stock#destroy", subject_id: "10", id: "1")
    end
  end
end
