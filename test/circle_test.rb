require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/circle'
class CircleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    c = Circle.new(p1, 10)
    [p1, 10, c]
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
    assert(c.area == 314.1592653589793, "area should be 314.159, was #{c.area}")
  end
end
