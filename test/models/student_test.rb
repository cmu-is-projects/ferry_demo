require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:family)
  should have_many(:registrations)
  should have_many(:camps).through(:registrations)

  # test validations with matchers (as possible)
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:family_id)

  should allow_value(1000).for(:rating)
  should allow_value(100).for(:rating)
  should allow_value(2872).for(:rating)
  should allow_value(0).for(:rating)
  should allow_value(nil).for(:rating)
  should_not allow_value(3001).for(:rating)
  should_not allow_value(50).for(:rating)
  should_not allow_value(-1).for(:rating)
  should_not allow_value(500.50).for(:rating)
  should_not allow_value("bad").for(:rating)

  should allow_value(18.years.ago.to_date).for(:date_of_birth)
  should allow_value(5.years.ago.to_date).for(:date_of_birth)
  should_not allow_value(Date.today).for(:date_of_birth)
  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(2).for(:date_of_birth)
  should_not allow_value(3.14159).for(:date_of_birth)

  # set up context
  context "Within context" do
    setup do 
      create_families
      create_students
    end
    
    teardown do
      delete_families
      delete_students
    end

    should "verify that the student's family is active in the system" do
      # test the inactive family
      create_inactive_families
      alan = FactoryGirl.build(:student, family: @ellis, first_name: "Alan")
      deny alan.valid?
      delete_inactive_families
      # test the nonexistent family
      simpsons = FactoryGirl.build(:family, family_name: "Simpsons")
      bart = FactoryGirl.build(:student, family: simpsons, first_name: "Bart")
      deny bart.valid?
    end

    should "verify that student with no rating has default set to zero" do
      create_inactive_students
      assert_equal 0, @ellen.rating
      delete_inactive_students
    end

    should "have a working 'make_inactive' method" do
      assert @peter.active
      @peter.make_inactive
      deny @peter.active
    end

    should "never allow a student to be destroyed" do
      deny @sean.destroy
    end

    should "show that name method works" do
      assert_equal "Skirpan, Zach", @zach.name
      assert_equal "Regan, Peter", @peter.name
    end
    
    should "show that proper_name method works" do
      assert_equal "Kelsey Regan", @kelsey.proper_name
      assert_equal "Max Skirpan", @max.proper_name
    end

    should "have working age method" do 
      assert_equal 13, @sean.age
      assert_equal 10, @ted.age
    end

    should "sort students in alphabetical order" do
      assert_equal ["Gruberman, Ted", "Regan, Kelsey", "Regan, Peter", "Regan, Sean", "Skirpan, Max", "Skirpan, Zach"], Student.alphabetical.all.map(&:name)
    end

    should "show that there are six active students" do
      create_inactive_students
      assert_equal 6, Student.active.size
      assert_equal ["Kelsey", "Max", "Peter", "Sean", "Ted", "Zach"], Student.active.all.map(&:first_name).sort
      delete_inactive_students
    end
    
    should "show that there is one inactive student" do
      create_inactive_students
      assert_equal 1, Student.inactive.size
      assert_equal ["Ellen"], Student.inactive.all.map(&:first_name).sort
      delete_inactive_students
    end

    should "have working below_rating scope" do |variable|
      assert_equal 4, Student.below_rating(1000).size
      assert_equal ["Kelsey", "Max", "Peter", "Ted"], Student.below_rating(1000).all.map(&:first_name).sort      
    end

    should "have working at_or_above_rating scope" do
      assert_equal 2, Student.at_or_above_rating(1010).size
      assert_equal ["Sean", "Zach"], Student.at_or_above_rating(1010).all.map(&:first_name).sort      
    end

  end
end
