require 'test_helper'

class CampTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:curriculum)
  should have_many(:camp_instructors)
  should have_many(:instructors).through(:camp_instructors)
  should belong_to(:location)
  should have_many(:registrations)
  should have_many(:students).through(:registrations)

  # test validations
  should validate_presence_of(:curriculum_id)
  should validate_presence_of(:start_date)
  should validate_presence_of(:time_slot)

  should allow_value(Date.today).for(:start_date)
  should allow_value(1.day.from_now.to_date).for(:start_date)
  should_not allow_value(1.day.ago.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(2).for(:start_date)
  should_not allow_value(3.14159).for(:start_date)
  
  should_not allow_value("bad").for(:end_date)
  should_not allow_value(2).for(:end_date)
  should_not allow_value(3.14159).for(:end_date) 

  should validate_numericality_of(:cost)
  should allow_value(0).for(:cost)
  should allow_value(120).for(:cost)
  should_not allow_value("bad").for(:cost)
  should_not allow_value(-20).for(:cost)
  should_not allow_value(3.14159).for(:cost)

  should allow_value("am").for(:time_slot)
  should allow_value("pm").for(:time_slot)
  should_not allow_value("bad").for(:time_slot)
  should_not allow_value("1:00").for(:time_slot)  
  should_not allow_value(900).for(:time_slot)

  
  should validate_numericality_of(:max_students)
  should allow_value(nil).for(:max_students)
  should allow_value(1).for(:max_students)
  should allow_value(12).for(:max_students)
  should_not allow_value("bad").for(:max_students)
  should_not allow_value(0).for(:max_students)
  should_not allow_value(-1).for(:max_students)
  should_not allow_value(3.14159).for(:max_students)

  # set up context
  context "Within context" do
    setup do 
      create_curriculums
      create_active_locations
      create_camps
    end
    
    teardown do
      delete_curriculums
      delete_active_locations
      delete_camps
    end

    should "verify there is a camp name method" do
      assert_equal "Endgame Principles", @camp4.name
      assert_equal "Mastering Chess Tactics", @camp1.name
    end

    should "verify that the camp's curriculum is active in the system" do
      # test the inactive curriculum
      bad_camp = FactoryGirl.build(:camp, curriculum: @smithmorra, location: @cmu, start_date: Date.new(2016,8,1), end_date: Date.new(2016,8,5))
      deny bad_camp.valid?
      # test the nonexistent curriculum
      gambit = FactoryGirl.build(:curriculum, name: "King's Gambit")
      gambit_camp = FactoryGirl.build(:camp, curriculum: gambit, location: @cmu, start_date: Date.new(2016,8,1), end_date: Date.new(2016,8,5))
      deny gambit_camp.valid?
    end 

    should "verify that the camp's location is active in the system" do
      # test the inactive location first
      create_inactive_locations
      bad_camp = FactoryGirl.build(:camp, curriculum: @tactics, location: @sqhill, start_date: Date.new(2016,8,1), end_date: Date.new(2016,8,5))
      deny bad_camp.valid?
      delete_inactive_locations
      # test the nonexistent location
      bhill = FactoryGirl.build(:location, name: "Blueberry Hill")
      bhill_camp = FactoryGirl.build(:camp, curriculum: @tactics, location: bhill, start_date: Date.new(2016,8,1), end_date: Date.new(2016,8,5))
      deny bhill_camp.valid?
    end 

    should "shows that there are four camps in in alphabetical order" do
      assert_equal ["Endgame Principles", "Mastering Chess Tactics", "Mastering Chess Tactics","Mastering Chess Tactics"], Camp.alphabetical.all.map{|c| c.curriculum.name}
    end

    should "shows that there are three active camps" do
      assert_equal 3, Camp.active.size
      assert_equal ["Endgame Principles", "Mastering Chess Tactics", "Mastering Chess Tactics"], Camp.active.all.map{|c| c.curriculum.name}.sort
    end
    
    should "shows that there is one inactive camp" do
      assert_equal 1, Camp.inactive.size
      assert_equal ["Mastering Chess Tactics"], Camp.inactive.all.map{|c| c.curriculum.name}.sort
    end

    should "shows that there are four camps in in chronological order" do
      assert_equal ["Mastering Chess Tactics - Jul 14", "Mastering Chess Tactics - Jul 14", "Mastering Chess Tactics - Jul 21", "Endgame Principles - Jul 21"], Camp.chronological.all.map{|c| "#{c.name} - #{c.start_date.strftime("%b %d")}"}
    end

    should "shows that there are two morning camps" do
      assert_equal 2, Camp.morning.size
      assert_equal ["Mastering Chess Tactics", "Mastering Chess Tactics"], Camp.morning.all.map{|c| c.name}.sort
    end

    should "shows that there are two afternoon camps" do
      assert_equal 2, Camp.afternoon.size
      assert_equal ["Endgame Principles", "Mastering Chess Tactics"], Camp.afternoon.all.map{|c| c.name}.sort
    end

    should "have a for_curriculum scope" do
      assert_equal ["Endgame Principles"], Camp.for_curriculum(@endgames.id).all.map(&:name).sort
    end

    should "shows that there are 3 upcoming camps and 1 past camp" do
      @camp1.update_attribute(:start_date, 7.days.ago.to_date) # update_attribute will bypass validation
      @camp1.update_attribute(:end_date, 2.days.ago.to_date)
      assert_equal 3, Camp.upcoming.size
      assert_equal 1, Camp.past.size
    end

    should "shows that a camp with same date and time slot but different location can be created" do
      @ok_camp = FactoryGirl.build(:camp, curriculum: @tactics, location: @north, start_date: Date.new(2016,7,21), end_date: Date.new(2016,7,25), time_slot: 'am')
      assert @ok_camp.valid?
    end

    should "shows that a duplicate camp (same date, time and location) cannot be created" do
      @bad_camp = FactoryGirl.build(:camp, curriculum: @tactics, location: @cmu, start_date: Date.new(2016,7,21), end_date: Date.new(2016,7,25), time_slot: 'am')
      deny @bad_camp.valid?
    end

    should "shows that a past camp can still be edited" do
      # move camp into the past with update_attribute (which skips validations)
      @camp1.update_attribute(:start_date, 7.days.ago.to_date)
      @camp1.update_attribute(:end_date, 2.days.ago.to_date)
      @camp1.reload  # to be safe, reload from database
      @camp1.max_students = 7
      @camp1.save!
      @camp1.reload # reload again from the database
      assert_equal 7, @camp1.max_students
    end

    should "check to make sure the end date is on or after the start date" do
      @bad_camp = FactoryGirl.build(:camp, curriculum: @endgames, location: @cmu, start_date: 9.days.from_now.to_date, end_date: 5.days.from_now.to_date)
      deny @bad_camp.valid?
      @okay_camp = FactoryGirl.build(:camp, curriculum: @endgames, location: @cmu, start_date: 9.days.from_now.to_date, end_date: 9.days.from_now.to_date)
      assert @okay_camp.valid?
    end

    should "confirm no registrations prior to destroying camp" do
      @empty_camp = FactoryGirl.create(:camp, curriculum: @endgames, location: @cmu, start_date: 9.days.from_now.to_date, end_date: 13.days.from_now.to_date)
      assert @empty_camp.destroy
    end

    should "confirm a camp with registrations not destroyed" do
      create_families
      create_students
      create_paid_registrations
      deny @camp1.destroy
      delete_paid_registrations
      delete_families
      delete_students
    end

    should "confirm no registrations prior to making camp inactive" do
      @empty_camp = FactoryGirl.create(:camp, curriculum: @endgames, location: @cmu, start_date: 9.days.from_now.to_date, end_date: 13.days.from_now.to_date)
      @empty_camp.active = false
      assert @empty_camp.valid?, "#{@empty_camp.to_yaml}"
      @empty_camp.destroy
    end

    should "confirm a camp with registrations cannot be made inactive" do
      create_families
      create_students
      create_paid_registrations
      @camp1.active = false
      deny @camp1.valid?, "#{@camp1.to_yaml}"
      delete_paid_registrations
      delete_families
      delete_students
    end

    should "not allow camp's max_students to exceed capacity" do
      # capacity of camp1 is 16 and current max_students is 8
      @camp1.max_students = 20
      deny @camp1.valid?
    end

    should "remove instructors from inactive camps" do
      create_instructors
      create_camp_instructors
      # we've created no registrations, so all camps are capable of being made inactive
      deny @camp1.camp_instructors.to_a.empty?
      @camp1.active = false
      @camp1.save
      @camp1.reload
      assert @camp1.camp_instructors.to_a.empty?
      delete_camp_instructors
      delete_instructors
    end

    should "have a method for finding active camps that still have openings" do
      create_families
      create_students
      create_paid_registrations
      # create a small, but full camp, as well
      small_camp = FactoryGirl.create(:camp, curriculum: @endgames, start_date: Date.new(2016,8,21), end_date: Date.new(2016,8,26), time_slot: "pm", location: @cmu, max_students: 2)
      zach_endgames  = FactoryGirl.create(:registration, camp: small_camp, student: @zach)
      kelsey_endgames = FactoryGirl.create(:registration, camp: small_camp, student: @kelsey)
      assert_equal [@camp1,@camp2,@camp4], Camp.openings
      delete_paid_registrations
      delete_families
      delete_students
      zach_endgames.delete
      kelsey_endgames.delete
    end
  end
end
