require 'spec_helper'

include Warden::Test::Helpers

describe "Tag" do
  describe "not logged in" do
    describe "GET /categories/:id/edit" do
      it "should redirect to sign_in page" do
        get edit_tag_path(1)
        response.should deny_access
      end
    end

    describe "PUT /categories/:id" do
      it "should redirect to sign_in page" do
        put tag_path(1)
        response.should deny_access
      end
    end

    describe "DELETE /categories/:id" do
      it "should redirect to sign_in page" do
        delete tag_path(1)
        response.should deny_access
      end
    end
  end

  describe "logged in" do
    before :all do
      @user = create :user
      @item = create :item
      @tag = create :tag
    end

    before :each do
      login_as @user
    end

    describe "GET /categories/:id/edit" do
      it "should render edit page" do
        get edit_tag_path(@tag)
        response.should render_template 'tags/edit'
      end
    end

    describe "PUT /categories/:id" do
      it "should update and redirect to categories index page" do
        put tag_path(@tag), tag: { name: 'Foobar' }
        response.should redirect_to tags_path
        assigns(:tag).reload.name.should eq('Foobar')
      end
    end

    describe "DELETE /categories/:id" do
      it "should delete and redirect to categories index page" do
        tag = create :tag
        delete tag_path(tag)
        response.should redirect_to tags_path
        assigns(:tag).should be_destroyed
      end
    end
  end
end
