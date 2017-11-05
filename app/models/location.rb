class Location
  require 'haversine'

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :latitude, :longitude

  validates_presence_of :latitude, :longitude
  validates :latitude, numericality: true
  validates :longitude, numericality: true

  def initialize(latitude, longitude)
    @latitude = latitude.to_f
    @longitude = longitude.to_f
  end

  def persisted?
    false
  end

  def to_s
    puts "Location(latitude:#{latitude},longitude:#{longitude}"
  end

  def distance(location)
    Haversine.distance(@latitude, @longitude, location.latitude, location.longitude)
  end

end
