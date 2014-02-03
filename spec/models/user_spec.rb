require 'spec_helper'

describe User do
  it "must have an email" do
    user = build :user, email: ''
    user.should have(1).error_on(:email)
  end

  it "should not allow invalid email" do
    user = build :user, email: 'not-an-email'
    user.should have(1).error_on(:email)
  end

  it "should require password and confirmation" do
    user = build :user, password: '', password_confirmation: ''
    user.should have(1).error_on(:password)
  end

  it "should require password and confirmation to match" do
    user = build :user, password: 'this_is_a_really_good_password', password_confirmation: 'blah blah blah'
    user.should have(1).error_on(:password_confirmation)
  end

  it "should reject passwords that are too short" do
    short_pwd = 'a' * 7
    user = build :user, password: short_pwd, password_confirmation: short_pwd
    user.should have(1).error_on(:password)
  end

  it "should reject passwords that are too long" do
    long_pwd = 'a' * 129
    user = build :user, password: long_pwd, password_confirmation: long_pwd
    user.should have(1).error_on(:password)
  end

  it "should accept valid password" do
    good_pwd = 'this password is fine'
    user = build :user, password: good_pwd, password_confirmation: good_pwd
    user.should be_valid
  end
end
