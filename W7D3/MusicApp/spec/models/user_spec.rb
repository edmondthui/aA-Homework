require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    context "checks if the password is the correct password" do
      it "should return true if the password is correct" do
        test_user = User.create(email: "test@example.com", password: "hunter2")
        expect(test_user.is_password?("hunter2")).to eq(true)
      end

      it "should return false if the password is incorrect" do
        test_user = User.create(email: "test@example.com", password: "hunter2")
        expect(test_user.is_password?("hunter3")).to eq(false)
      end
    end
  end

  describe "#reset_session_token" do
    it "resets the session token and saves the session token to the database" do
      test_user = User.create(email: "test@example.com", password: "hunter2")
      session_token = test_user.session_token
      expect(session_token == test_user.reset_session_token!).to eq(false)
    end
  end

  describe "::find_by_credentials" do
    context "finds the user by the email in the database" do
      it "returns the user if the password is correct" do
        test_user = User.create(email: "test@example.com", password: "hunter2")
        found_user = User.find_by_credentials("test@example.com", "hunter2")
        expect(test_user == found_user).to eq(true)
      end

      it "returns nil if the password is incorrect" do
        test_user = User.create(email: "test@example.com", password: "hunter2")
        found_user = User.find_by_credentials("test@example.com", "hunter3")
        expect(test_user == found_user).to eq(false)
      end
    end
  end


end
