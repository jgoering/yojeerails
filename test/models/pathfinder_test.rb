require 'test_helper'

class PathfinderTest < ActiveSupport::TestCase
  test 'should return array with length of number of couriers' do
    couriers = 3
    result = Pathfinder.new.find_path([], DISTRIBUTION_POINT, couriers)
    assert_equal(couriers, result.length)
  end

  test 'element in array should start with DISTRIBUTION_POINT' do
    couriers = 1
    result = Pathfinder.new.find_path([], DISTRIBUTION_POINT, couriers)
    assert_equal(DISTRIBUTION_POINT, result[0][0])
  end

  test 'with one location, it should be second element in the path' do
    couriers = 1
    location = Location.new(5, 5)
    result = Pathfinder.new.find_path([location], DISTRIBUTION_POINT, couriers)
    assert_equal(location, result[0][1])
  end

  test 'two opposite locations should be assigned to one courier each' do
    nof_couriers = 2
    locations = [Location.new(5, 5), Location.new(-5, -5)]
    result = Pathfinder.new.find_path(locations, Location.new(0, 0), nof_couriers)
    assert_equal(locations[0], result[0][1])
    assert_equal(locations[1], result[1][1])
  end

  test 'assert that locations are sorted by distance to distribution point' do
    couriers = 1
    locations = [Location.new(6, 6), Location.new(5, 5)]
    result = Pathfinder.new.find_path(locations, Location.new(0, 0), couriers)
    assert_equal(locations[0], result[0][2])
    assert_equal(locations[1], result[0][1])
  end

  test 'assert that courier paths are balanced' do
    couriers = 2
    locations = [
      Location.new(1, 1),
      Location.new(2, 2),
      Location.new(3, 3),
      Location.new(4, 4),
      Location.new(5, 5),
      Location.new(6, 6)
    ]
    result = Pathfinder.new.find_path(locations, Location.new(0, 0), couriers)
    assert_equal(4, result[0].length)
    assert_equal(4, result[1].length)
  end
end
