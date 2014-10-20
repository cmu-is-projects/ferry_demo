require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:student)
  should belong_to(:camp)
  should have_one(:family).through(:student)

  # test validations with matchers
  should validate_presence_of(:camp_id)
  should validate_presence_of(:student_id)
  should validate_presence_of(:payment_status)

  should allow_value("full").for(:payment_status)
  should allow_value("deposit").for(:payment_status)
  should_not allow_value("none").for(:payment_status)
  should_not allow_value(100).for(:payment_status)
  should_not allow_value(0.500).for(:payment_status)

  should allow_value(0).for(:points_earned)
  should allow_value(50).for(:points_earned)
  should_not allow_value("none").for(:points_earned)
  should_not allow_value(3.14159).for(:points_earned)

  # set up context
  context "Within context" do
    setup do 
      create_families
      create_students
      create_curriculums
      create_locations
      create_camps
      create_paid_registrations
      create_deposit_registrations
    end
    
    teardown do
      delete_families
      delete_students
      delete_curriculums
      delete_locations
      delete_camps
      delete_paid_registrations
      delete_deposit_registrations
    end

    should "verify that the student is active in the system" do
      # test the inactive student
      create_inactive_students
      bad_registration = FactoryGirl.build(:registration, student: @ellen, camp: @camp1)
      deny bad_registration.valid?
      create_inactive_students
      # test the nonexistent student
      ned = FactoryGirl.build(:student, family: @grubermans, first_name: "Ned")
      phantom_registration = FactoryGirl.build(:registration, student: ned, camp: @camp1)
      deny phantom_registration.valid?
    end

    should "verify that the camp is active in the system" do
      # test the inactive camp
      bad_assignment = FactoryGirl.build(:registration, student: @max, camp: @camp3)
      deny bad_assignment.valid?
      # test the nonexistent camp
      phantom_camp = FactoryGirl.build(:camp, curriculum: @tactics, location: @cmu, start_date: Date.new(2015,10,5), end_date: Date.new(2015,10,9))
      phantom_registration = FactoryGirl.build(:registration, student: @max, camp: phantom_camp)
      deny phantom_registration.valid?
    end

    should "verify that the student has a rating appropriate for the camp" do
      # verify that Sean (rating 1252) can register for endgames (700-1500)
      sean_endgames = FactoryGirl.build(:registration, student: @sean, camp: @camp4)
      assert sean_endgames.valid?
      # verify that Max (rating 535) cannot register for endgames (700-1500)
      max_endgames = FactoryGirl.build(:registration, student: @max, camp: @camp4)
      deny max_endgames.valid?
    end

    should "verify that student is not registered for another camp at the same time" do
      camp5 = FactoryGirl.create(:camp, curriculum: @endgames, location: @north) 
      bad_registration = FactoryGirl.build(:registration, student: @peter, camp: camp5)
      deny bad_registration.valid?
      camp5.delete
    end

    should "have a working paid scope" do
      assert_equal 3, Registration.paid.size
      assert_equal %w[Max Peter Peter], Registration.paid.map{|r| r.student.first_name}.sort
    end

    should "have a working deposit_only scope" do
      assert_equal 2, Registration.deposit_only.size
      assert_equal %w[Kelsey Zach], Registration.deposit_only.map{|r| r.student.first_name}.sort
    end

    should "have a working by_student scope" do
      assert_equal ["Regan, Kelsey", "Regan, Peter", "Regan, Peter", "Skirpan, Max", "Skirpan, Zach"], Registration.by_student.map{|r| r.student.name}
    end

  end
end
