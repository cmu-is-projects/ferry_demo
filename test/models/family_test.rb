require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:students)
  should have_many(:registrations).through(:students)

  # test validations with matchers
  should validate_presence_of(:family_name)
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
      create_families
      create_inactive_families
    end
    
    teardown do
      delete_families
      delete_inactive_families
    end

    should "sort families in alphabetical order" do
      assert_equal %w[Ellis Gruberman Regan Skirpan], Family.alphabetical.all.map(&:family_name)
    end

    should "show that there are three active families" do
      assert_equal 3, Family.active.size
      assert_equal %w[Gruberman Regan Skirpan], Family.active.all.map(&:family_name).sort
    end
    
    should "show that there is one inactive family" do
      assert_equal 1, Family.inactive.size
      assert_equal %w[Ellis], Family.inactive.all.map(&:family_name).sort
    end

    should "strip non-digits from the phone number" do
      assert_equal "4123694314", @regans.phone
    end

    should "correctly assess that a family is not destroyable" do
      deny @regans.destroy
    end

    should "have a working 'make_inactive' method" do
      assert @grubermans.active
      @grubermans.make_inactive
      deny @grubermans.active
    end
  end
end
