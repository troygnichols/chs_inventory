require 'spec_helper'

include Warden::Test::Helpers

describe "Items", :type => :request do
  describe "not logged in" do
    describe "GET /items/new" do
      it "should redirect to sign_in page" do
        get new_item_path
        expect(response).to deny_access
      end
    end

    describe "GET /items/:id/edit" do
      it "should redirect to sign_in page" do
        get edit_item_path(1)
        expect(response).to deny_access
      end
    end

    describe "POST /items" do
      it "should redirect to sign_in page" do
        post items_path
        expect(response).to deny_access
      end
    end

    describe "PUT /items/:id" do
      it "should redirect to sign_in page" do
        put item_path(1)
        expect(response).to deny_access
      end
    end

    describe "DELETE /items/:id" do
      it "should redirect to sign_in page" do
        delete item_path(1)
        expect(response).to deny_access
      end
    end
  end

  describe "logged in" do
    before :all do
      @user = create :user
      @item = create :item
      @tag_name = 'Foobar'
    end

    before :each do
      login_as @user
    end

    describe "GET /items/new" do
      it "should render new page" do
        get new_item_path
        expect(response).to render_template 'items/new'
      end
    end

    describe "GET /items/:id/edit" do
      it "should render edit page" do
        get edit_item_path(@item)
        expect(response).to render_template 'items/edit'
      end
    end

    describe "POST /items" do
      it "should create and redirect to items index page" do
        post items_path, item: attributes_for(:item), tag: { name: @tag_name }
        expect(response).to redirect_to items_path
      end
    end

    describe "PUT /items/:id" do
      it "should update and redirect to items index page" do
        put item_path(@item), item: { size: '1000' }, tag: { name: @tag_name }
        expect(response).to redirect_to items_path
        expect(assigns(:item).reload.size).to eq('1000')
      end
    end

    describe "DELETE /items/:id" do
      it "should delete and redirect to items index page" do
        item = create :item
        delete item_path(item)
        expect(response).to redirect_to items_path
        expect(assigns(:item)).to be_destroyed
      end
    end
  end
end
