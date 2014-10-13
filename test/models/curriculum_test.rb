require 'test_helper'

class CurriculumTest < ActiveSupport::TestCase  
  # test relationships
  should have_many(:camps)

  # test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  should allow_value(1000).for(:min_rating)
  should allow_value(100).for(:min_rating)
  should allow_value(2872).for(:min_rating)
  should allow_value(0).for(:min_rating)

  should_not allow_value(nil).for(:min_rating)
  should_not allow_value(3001).for(:min_rating)
  should_not allow_value(50).for(:min_rating)
  should_not allow_value(-1).for(:min_rating)
  should_not allow_value(500.50).for(:min_rating)
  should_not allow_value("bad").for(:min_rating)

  should allow_value(1000).for(:max_rating)
  should allow_value(100).for(:max_rating)
  should allow_value(2872).for(:max_rating)

  should_not allow_value(nil).for(:max_rating)
  should_not allow_value(3001).for(:max_rating)
  should_not allow_value(50).for(:max_rating)
  should_not allow_value(-1).for(:max_rating)
  should_not allow_value(500.50).for(:max_rating)
  should_not allow_value("bad").for(:max_rating)

    # test that max greater than min rating
  should "shows that max rating is greater than min rating" do
    bad = FactoryGirl.build(:curriculum, name: "Bad curriculum", min_rating: 500, max_rating: 500)
    very_bad = FactoryGirl.build(:curriculum, name: "Very bad curriculum", min_rating: 500, max_rating: 450)
    deny bad.valid?
    deny very_bad.valid?
  end

  context "Within context" do
    # create the objects I want with factories
    setup do 
      create_curriculums
    end
    
    # and provide a teardown method as well
    teardown do
      delete_curriculums
    end

    # test the scope 'alphabetical'
    should "shows that there are three curriculums in in alphabetical order" do
      assert_equal ["Endgame Principles", "Mastering Chess Tactics", "Smith-Morra Gambit"], Curriculum.alphabetical.all.map(&:name), "#{Curriculum.class}"
    end
    
    # test the scope 'active'
    should "shows that there are two active curriculums" do
      assert_equal 2, Curriculum.active.size
      assert_equal ["Endgame Principles", "Mastering Chess Tactics"], Curriculum.active.all.map(&:name).sort, "#{Curriculum.methods}"
    end
    
    # test the scope 'active'
    should "shows that there is one inactive curriculum" do
      assert_equal 1, Curriculum.inactive.size
      assert_equal ["Smith-Morra Gambit"], Curriculum.inactive.all.map(&:name).sort
    end

    # test the scope 'for_rating'
    should "shows that there is a working for_rating scope" do
      assert_equal 1, Curriculum.for_rating(1400).size
      assert_equal ["Mastering Chess Tactics","Smith-Morra Gambit"], Curriculum.for_rating(600).all.map(&:name).sort
    end

    # test that curriculums for upcoming camps with no registrations yet can be made inactive
    should "shows that curriculums for upcoming camps w/o registrations can be inactive" do
      create_active_locations
      create_camps
      deny @tactics.camps.upcoming.to_a.empty?
      @tactics.active = false
      assert @tactics.valid?
      delete_active_locations
      delete_camps
    end

    # test that curriculums for upcoming camps with registrations cannot be made inactive
    should "shows that curriculums for upcoming camps with registrations stays active" do
      create_active_locations
      create_camps
      create_families
      create_students
      create_paid_registrations
      @tactics.active = false
      deny @tactics.valid?
      delete_active_locations
      delete_camps
      delete_families
      delete_students
      delete_paid_registrations
    end

    # test that curriculums for past camps only can be made inactive
    should "shows that curriculums used only in past camps can be inactive" do
      create_active_locations
      create_families
      create_students
      nimzo = FactoryGirl.create(:curriculum, name: "Nimzo-Indian Defense", min_rating: 1000, max_rating: 3000, description: "All about the Nimzo-Indian Defense.")
      camp11 = FactoryGirl.create(:camp, curriculum: nimzo, start_date: Date.new(2015,6,3), end_date: Date.new(2015,6,7), time_slot: "pm", location: @north)
      camp11.start_date = Date.new(2013,6,3)
      camp11.end_date = Date.new(2013,6,7)   
      camp11.save
      camp11.reload
      deny nimzo.camps.past.to_a.empty?
      # add a registration to this past camp (even with registrations, if only past then can be inactive)
      zach_nimzo  = FactoryGirl.create(:registration, camp: camp11, student: @zach)
      nimzo.active = false
      assert nimzo.valid?
      delete_active_locations
      delete_families
      delete_students
      nimzo.delete
      camp11.delete
      zach_nimzo.delete
    end

    should "correctly assess that a curriculum is not destroyable" do
      deny @tactics.destroy
    end
  end
end
