require 'csv'

DISTRIBUTION_POINT = Location.new(11.552931, 104.933636)
WIDTH = 1080
HEIGHT = 500
COURIERS = 16

Rails.application.config.before_initialize do
  LOCATIONS = []
  CSV.foreach('config/locations.csv', :headers => false) do |row|
    location = Location.new(row[0], row[1])
    if location.valid? && location.distance(DISTRIBUTION_POINT).to_km < 300
      LOCATIONS.push(location)
    end
  end
end

