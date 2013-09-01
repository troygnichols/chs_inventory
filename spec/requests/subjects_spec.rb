require 'spec_helper'

include Warden::Test::Helpers

describe "Subjects" do
  describe "not logged in" do
    describe "GET /subjects" do
      it "should redirect to sign_in page" do
        get subjects_path
        response.should deny_access
      end
    end

    describe "GET /subejcts/:id" do
      it "should redirect to sign_in page" do
        get subject_path(1)
        response.should deny_access
      end
    end

    describe "GET /subjects/new" do
      it "should redirect to sign_in page" do
        get new_subject_path
        response.should deny_access
      end
    end

    describe "GET /subjects/:id/edit" do
      it "should redirect to sign_in page" do
        get edit_subject_path(1)
        response.should deny_access
      end
    end

    describe "POST /subjects" do
      it "should redirect to sign_in page" do
        post subjects_path
        response.should deny_access
      end
    end

    describe "PUT /subjects/:id" do
      it "should redirect to sign_in page" do
        put subject_path(1)
        response.should deny_access
      end
    end

    describe "DELETE /subjects/:id" do
      it "should redirect to sign_in page" do
        delete subject_path(1)
        response.should deny_access
      end
    end
  end

  describe "logged in" do
    before(:all) do
      @subject = create :subject
      @user = create :user
    end

    after(:all) do
      @subject.delete
      @user.delete
    end

    before(:each) do
      login_as @user
    end

    describe "GET /subjects" do
      it "should get subjects index page" do
        get subjects_path
        response.status.should be(200)
        response.should render_template 'subjects/index'
      end
    end

    describe "GET /subjects/:id" do
      it "should get subject show page" do
        get subject_path(@subject)
        response.status.should be(200)
        response.should render_template 'subjects/show'
      end
    end

    describe "GET /subjects/new" do
      it "should get subject new page" do
        get new_subject_path
        response.status.should be(200)
        response.should render_template 'subjects/new'
      end
    end

    describe "GET /subjects/:id/edit" do
      it "should get subject edit page" do
        get edit_subject_path(@subject)
        response.status.should be(200)
        response.should render_template 'subjects/edit'
      end
    end

    describe "POST /subjects" do
      it "should create subject" do
        post subjects_path, subject: attributes_for(:subject)
        response.should redirect_to subjects_path
      end
    end

    describe "PUT /subjects/:id" do
      it "should update subject" do
        put subject_path(@subject), subject: { name: "New Name" }
        response.should redirect_to subjects_path
        assert_equal "New Name", assigns(:subject).reload.name
      end
    end

    describe "DELETE /subjects/:id" do
      it "should delete subject" do
        subject = create :subject
        delete subject_path(subject)
        response.should redirect_to subjects_path
        assigns(:subject).should be_destroyed
      end
    end
  end
end
