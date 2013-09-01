require 'spec_helper'

describe "ItemInStocks" do
  describe "not logged in" do
    describe "GET /items_in_stock"

    describe "GET /items_in_stock" do
      it "" do
        get subject_items_in_stock_path(@subject)
        response.should redirect_to(subject_path(@subject))
      end
    end
  end

  describe "logged in" do
  end
end
