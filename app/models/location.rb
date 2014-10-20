class Location < ActiveRecord::Base
  # relationships
  has_many :camps

  # states list
  STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]

  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :street_1, presence: true
  validates :state, inclusion: { in: STATES_LIST.map{|a,b| b}, message: "is not valid state", allow_blank: true }
  validates :zip, presence: true, format: { with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true }
  validates :max_capacity, presence: true, numericality: { only_integer: true, greater_than: 0, allow_blank: true }
  
  # scopes
  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # callbacks
  before_destroy :verify_that_never_used_for_camps
  before_validation :get_location_coordinates

  private
  def verify_that_never_used_for_camps
    self.camps.empty?
  end

  def get_location_coordinates
    str = self.street_1
    zip = self.zip
    
    coord = Geocoder.coordinates("#{str}, #{zip}")
    if coord
      self.latitude = coord[0]
      self.longitude = coord[1]
    else 
      errors.add(:base, "Error with geocoding")
    end
    coord
  end

end
