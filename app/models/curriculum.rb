class Curriculum < ActiveRecord::Base
  include ChessCampHelpers

  # relationships
  has_many :camps

  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  ratings_array = [0] + (100..3000).to_a
  validates :min_rating, numericality: { only_integer: true }, inclusion: { in: ratings_array }
  validates :max_rating, numericality: { only_integer: true }, inclusion: { in: ratings_array }
  validate :max_rating_greater_than_min_rating
  validate :curriculum_can_be_deactivated

  # scopes
  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :for_rating, ->(rating) { where("min_rating <= ? and max_rating >= ?", rating, rating) }

  # callbacks
  before_destroy :is_never_destroyable

  private
  def max_rating_greater_than_min_rating
    # only testing 'greater than' in this method, so...
    return true if self.max_rating.nil? || self.min_rating.nil?
    unless self.max_rating > self.min_rating
      errors.add(:max_rating, "must be greater than the minimum rating")
      return false
    end
    return true
  end

  def curriculum_can_be_deactivated
    upcoming_camps_with_registrations = self.camps.upcoming.map{|c| c.registrations}.flatten
    if !self.active && !upcoming_camps_with_registrations.empty?
      errors.add(:base, "Curriculum cannot be inactive because it is used in an upcoming camp")
      return false
    end
  end

end
