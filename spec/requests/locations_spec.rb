require 'spec_helper'

include Warden::Test::Helpers

describe "Subjects" do
  describe "not logged in" do
    describe "GET /locations" do
      it "should redirect to sign_in page" do
        get locations_path
        response.should deny_access
      end
    end

    describe "GET /subejcts/:id" do
      it "should redirect to sign_in page" do
        get location_path(1)
        response.should deny_access
      end
    end

    describe "GET /locations/new" do
      it "should redirect to sign_in page" do
        get new_location_path
        response.should deny_access
      end
    end

    describe "GET /locations/:id/edit" do
      it "should redirect to sign_in page" do
        get edit_location_path(1)
        response.should deny_access
      end
    end

    describe "POST /locations" do
      it "should redirect to sign_in page" do
        post locations_path
        response.should deny_access
      end
    end

    describe "PUT /locations/:id" do
      it "should redirect to sign_in page" do
        put location_path(1)
        response.should deny_access
      end
    end

    describe "DELETE /locations/:id" do
      it "should redirect to sign_in page" do
        delete location_path(1)
        response.should deny_access
      end
    end
  end

  describe "logged in" do
    before :all do
      @location = create :location
      @user = create :user
    end

    before :each do
      login_as @user
    end

    describe "GET /locations" do
      it "should render locations index page" do
        get locations_path
        response.status.should be(200)
        response.should render_template 'locations/index'
      end
    end

    describe "GET /locations/:id" do
      it "should render location show page" do
        get location_path(@location)
        response.status.should be(200)
        response.should render_template 'locations/show'
      end
    end

    describe "GET /locations/new" do
      it "should render location new page" do
        get new_location_path
        response.status.should be(200)
        response.should render_template 'locations/new'
      end
    end

    describe "GET /locations/:id/edit" do
      it "should render location edit page" do
        get edit_location_path(@location)
        response.status.should be(200)
        response.should render_template 'locations/edit'
      end
    end

    describe "POST /locations" do
      it "should create location" do
        post locations_path, location: attributes_for(:location)
        response.should redirect_to locations_path
      end
    end

    describe "PUT /locations/:id" do
      it "should update location" do
        put location_path(@location), location: { name: "New Name" }
        response.should redirect_to locations_path
        assert_equal "New Name", assigns(:location).reload.name
      end
    end

    describe "DELETE /locations/:id" do
      it "should delete location" do
        location = create :location
        delete location_path(location)
        response.should redirect_to locations_path
        assigns(:location).should be_destroyed
      end
    end
  end
end
