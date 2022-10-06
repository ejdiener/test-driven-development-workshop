require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/circle'

class CircleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    c = Circle.new(p1, 1, 'C')
    [p1, 1, c]
  end

  def test_point_not_point_error
    error = assert_raises(StandardError) { Circle.new([0, 0], 1, 'C') }
    assert_equal('point is not a Point', error.message)
  end

  def test_radius_not_number_error
    error = assert_raises(StandardError) { Circle.new(Point.new(0, 0), '1', 'C') }
    assert_equal('radius is not a number', error.message)
  end

  def test_get_point
    p1, _, c = setup
    assert(p1 == c.point, 'Points should be equal')
  end

  def test_get_radius
    _, r, c = setup
    assert(r == c.radius, 'Radius values should be equal')
  end

  def test_get_area
    _, _, c = setup
    assert(c.area == 3.141592653589793, "area should be 3.141592653589793, was #{c.area}")
  end
end
