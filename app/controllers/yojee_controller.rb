class YojeeController < ApplicationController
  def index
    start = Time.now
    @minx = LOCATIONS.min_by(&:longitude).longitude
    @miny = LOCATIONS.min_by(&:latitude).latitude
    @factorx = WIDTH / (LOCATIONS.max_by(&:longitude).longitude - @minx)
    @factory = HEIGHT / (LOCATIONS.max_by(&:latitude).latitude - @miny)
    @paths = Pathfinder.new.find_path(LOCATIONS, DISTRIBUTION_POINT, COURIERS)
    @distances = @paths.map do |path|
      sum = 0
      path.each_with_index do |location, index|
        sum += location.distance(path[index - 1]).to_km unless index.zero?
      end
      sum
    end
    @time = Time.now - start
  end
end
