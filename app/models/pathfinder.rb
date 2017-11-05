class Pathfinder
  def find_path(locations, distribution_point = DISTRIBUTION_POINT, nof_couriers = 1)
    result = Array.new(nof_couriers) { |_index| [distribution_point] }

    sorted_locations = locations.sort_by { |location| location.distance(distribution_point).to_m }

    # iterate over locations and find nearest courier
    sorted_locations.each do |location|
      nearest = result.min_by { |path| path.last.distance(location).to_m }
      nearest.push(location)
    end

    Balancer.new.balance(result)
  end
end
