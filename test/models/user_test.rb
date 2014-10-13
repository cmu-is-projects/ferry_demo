require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should belong_to(:instructor)
  should have_secure_password

  # test validations
  should validate_presence_of(:username)

  should allow_value("admin").for(:role)
  should allow_value("instructor").for(:role)
  should_not allow_value("bad").for(:role)
  should_not allow_value("hacker").for(:role)
  should_not allow_value(10).for(:role)
  should_not allow_value("leader").for(:role)
  should_not allow_value(nil).for(:role)
  
  
  # context
  context "Within context" do
    setup do
      create_instructors
      create_users
    end
    
    teardown do
      delete_instructors
      delete_users
    end

    should "require users to have unique, case-insensitive usernames" do
      assert_equal "mheimann", @mark_user.username
      # try to switch to Alex's username 'tank'
      @mark_user.username = "TANK"
      deny @mark_user.valid?, "#{@mark_user.username}"
    end

    should "allow user to authenticate with password" do
      assert @mark_user.authenticate("secret")
      deny @mark_user.authenticate("notsecret")
    end

    should "require a password for new users" do
      bad_user = FactoryGirl.build(:user, username: "tank", instructor: @alex, password: nil)
      deny bad_user.valid?
    end
    
    should "require passwords to be confirmed and matching" do
      bad_user_1 = FactoryGirl.build(:user, username: "tank", instructor: @alex, password: "secret", password_confirmation: nil)
      deny bad_user_1.valid?
      bad_user_2 = FactoryGirl.build(:user, username: "tank", instructor: @alex, password: "secret", password_confirmation: "sauce")
      deny bad_user_2.valid?
    end
    
    should "require passwords to be at least four characters" do
      bad_user = FactoryGirl.build(:user, username: "tank", instructor: @alex, password: "no")
      deny bad_user.valid?
    end

    should "have a role? method to use in authorization" do
      assert @mark_user.role?(:admin)
      deny @mark_user.role?(:instructor)
    end

  end
end
