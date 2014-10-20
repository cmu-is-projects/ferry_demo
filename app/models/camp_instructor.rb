class CampInstructor < ActiveRecord::Base
  include ChessCampHelpers

  # relationships
  belongs_to :camp
  belongs_to :instructor

  # validations
  validates :camp_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :instructor_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validate :instructor_is_not_already_assigned_to_camp, on: :create
  validate :instructor_is_not_already_assigned_to_another_camp_at_same_time, on: :create
  validate :instructor_is_active_in_system
  validate :camp_is_active_in_system

  private
  def instructor_is_not_already_assigned_to_camp
    return true if self.camp.nil? || self.instructor.nil?
    unless CampInstructor.where(camp_id: self.camp_id, instructor_id: self.instructor_id).to_a.empty?
      errors.add(:base, "Instructor has already been assigned to this camp")
    end
  end

  def instructor_is_not_already_assigned_to_another_camp_at_same_time
    return true if self.camp.nil? || self.instructor.nil?
    other_instructors_teaching_at_that_time = Camp.where(start_date: self.camp.start_date, time_slot: self.camp.time_slot).map{|c| c.instructors }.flatten
    if other_instructors_teaching_at_that_time.include?(self.instructor)
      errors.add(:base, "Instructor is already assigned to another camp at this time")
    end
  end

  def instructor_is_active_in_system
    is_active_in_system(:instructor)
  end

  def camp_is_active_in_system
    is_active_in_system(:camp)  
  end
end
