class Registration < ActiveRecord::Base
  include ChessCampHelpers
  
  # relationships
  belongs_to :camp
  belongs_to :student
  has_one :family, through: :student

  # validations
  validates :camp_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :student_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :points_earned, numericality: { greater_than_or_equal_to: 0, only_integer: true, allow_blank: true }
  validates :payment_status, presence: true, inclusion: { in: %w[deposit full] }  
  validate :student_is_active_in_the_system, on: :create
  validate :camp_is_active_in_the_system, on: :create
  validate :student_rating_appropriate_for_camp, on: :create
  validate :student_is_not_already_registered_to_another_camp_at_same_time, on: :create
  
  # scopes
  scope :deposit_only, -> { where(payment_status: 'deposit') }
  scope :paid,         -> { where(payment_status: 'full') }
  scope :by_student,   -> { joins(:student).order('students.last_name, students.first_name') }


  private
  def student_rating_appropriate_for_camp
    return true if camp_id.nil? || student_id.nil?
    unless (camp.curriculum.min_rating..camp.curriculum.max_rating).cover?(student.rating)
      errors.add(:base, "Student rating not within bounds for camp")
    end
  end

  def student_is_not_already_registered_to_another_camp_at_same_time
    return true if self.camp.nil? || self.student.nil?
    students_registered_at_that_time = Camp.where(start_date: self.camp.start_date, time_slot: self.camp.time_slot).map{|c| c.students }.flatten
    if students_registered_at_that_time.include?(self.student)
      errors.add(:base, "Student is already registered for another camp at this time")
    end
  end

  def student_is_active_in_the_system
    is_active_in_system(:student)
  end

  def camp_is_active_in_the_system
    is_active_in_system(:camp)
  end
end
