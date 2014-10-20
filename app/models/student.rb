class Student < ActiveRecord::Base
  include ChessCampHelpers

  # relationships
  belongs_to :family
  has_many :registrations
  has_many :camps, through: :registrations

  # validations
  validates_presence_of :family_id, :first_name, :last_name
  ratings_array = [0] + (100..3000).to_a
  validates :rating, numericality: { only_integer: true, allow_blank: true }, inclusion: { in: ratings_array, allow_blank: true }  
  validates_date :date_of_birth, :before => lambda { Date.today }, :before_message => "cannot be in the future", allow_blank: true, on: :create
  validate :family_is_active_in_the_system, on: :create

  # scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :below_rating, ->(ceiling) { where('rating < ?', ceiling) }
  scope :at_or_above_rating, ->(floor) { where('rating >= ?', floor) }

  # callbacks
  before_destroy :is_never_destroyable

  # other methods
  def name
    "#{self.last_name}, #{self.first_name}"
  end

  def proper_name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    return nil if date_of_birth.blank?
    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  end

  def make_inactive
    self.active = false
    self.save!
  end

  private
  def family_is_active_in_the_system
    is_active_in_system(:family)
  end

end
