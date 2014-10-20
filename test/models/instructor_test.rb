require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:camp_instructors)
  should have_many(:camps).through(:camp_instructors)
  should have_one(:user)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:phone)

  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)
  
  should allow_value("4122683259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  
  should_not allow_value("2683259").for(:phone)
  should_not allow_value("4122683259x224").for(:phone)
  should_not allow_value("800-EAT-FOOD").for(:phone)
  should_not allow_value("412/268/3259").for(:phone)
  should_not allow_value("412-2683-259").for(:phone)

  # set up context
  context "Within context" do
    setup do 
      create_instructors
    end
    
    teardown do
      delete_instructors
    end

    should "show that there are three instructors in alphabetical order" do
      assert_equal ["Alex", "Mark", "Rachel"], Instructor.alphabetical.all.map(&:first_name)
    end

    should "show that there are two active instructors" do
      assert_equal 2, Instructor.active.size
      assert_equal ["Alex", "Mark"], Instructor.active.all.map(&:first_name).sort
    end
    
    should "show that there is one inactive instructor" do
      assert_equal 1, Instructor.inactive.size
      assert_equal ["Rachel"], Instructor.inactive.all.map(&:first_name).sort
    end

    should "strip non-digits from the phone number" do
      assert_equal "4122682323", @alex.phone
      assert_equal "4122682324", @rachel.phone
    end

    should "show that there are two instructors needing bios" do
      assert_equal 2, Instructor.needs_bio.size
      assert_equal ["Alex", "Rachel"], Instructor.needs_bio.all.map(&:first_name).sort
    end

    should "show that name method works" do
      assert_equal "Heimann, Mark", @mark.name
      assert_equal "Heimann, Alex", @alex.name
    end
    
    should "show that proper_name method works" do
      assert_equal "Mark Heimann", @mark.proper_name
      assert_equal "Alex Heimann", @alex.proper_name
    end

    should "have a class method to give array of instructors for a given camp" do
      delete_instructors
      create_curriculums
      create_instructors
      create_active_locations
      create_camps
      create_camp_instructors
      assert_equal ["Alex", "Mark"], Instructor.for_camp(@camp1).map(&:first_name).sort
      assert_equal ["Mark"], Instructor.for_camp(@camp4).map(&:first_name).sort
      delete_camp_instructors
      delete_curriculums
      delete_instructors
      delete_active_locations
      delete_camps
    end

    should "deactivate a user if the instructor becomes inactive" do
      create_users
      @alex.active = false
      @alex.save
      deny @alex.user.active
      delete_users
    end

    should "deactivate an instructor without a user causes no error" do
      # set Rachel (who has no user account) to active first
      @rachel.active = true
      @rachel.save
      @rachel.reload
      @rachel.active = false
      # now reset to her back to inactive
      @rachel.save  
      @rachel.reload    
      deny @rachel.active
    end

    should "never allow an instructor to be destroyed" do
      deny @alex.destroy
      deny @mark.destroy
    end

  end
end
