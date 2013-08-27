require 'spec_helper'

describe "ItemInStocks" do
  before(:all) do
    @subject = FactoryGirl.create :subject
  end

  describe "GET /items_in_stock" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get subject_items_in_stock_path(@subject)
      response.should redirect_to(subject_path(@subject))
    end
  end
end
