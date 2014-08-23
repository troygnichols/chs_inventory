require 'spec_helper'

include Warden::Test::Helpers
include Devise::TestHelpers

describe "registration", type: :request do
  describe "when email is included in whitelist" do
    before(:all) do
      @email = 'foobar@example.com'
      RegistrationWhitelist.add!(@email)
    end

    it "allows registration" do
      post user_registration_path, user: {
        email: @email,
        password: 'validpass',
        password_confirmation: 'validpass'
      }
      expect(response).to redirect_to root_path
    end

    it "creates user" do
      expect {
        post user_registration_path, user: {
          email: @email,
          password: 'validpass',
          password_confirmation: 'validpass'
        }
      }.to change { User.count }.by(1)
    end

    it "signs in the new user" do
      post user_registration_path, user: {
        email: @email,
        password: 'validpass',
        password_confirmation: 'validpass'
      }
      expect(controller.current_user.email).to eq(@email)
    end
  end

  describe "when email is not in whitelist" do
    it "rejects registration request" do
      post user_registration_path, user: {
        email: @email,
        password: 'validpass',
        password_confirmation: 'validpass'
      }
      expect(response).to redirect_to new_user_registration_url
    end

    it "does not create a user" do
      expect {
        post user_registration_path, user: {
          email: @email,
          password: 'validpass',
          password_confirmation: 'validpass'
        }
      }.not_to change { User.count }
    end
  end
end
