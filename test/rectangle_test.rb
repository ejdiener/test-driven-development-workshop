require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/rectangle'

class RectangleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    p2 = Point.new(2, 3)
    r = Rectangle.new(p1, p2)
    [p1, p2, r]
  end

  def test_get_points
    p1, p2, r = setup
    r_points = r.points
    assert(p1 == r_points[0] && p2 == r_points[1], 'Points should be equal')
  end

  def test_get_area
    _, _, _, r = setup
    assert(r.area == 6, 'area should be 6')
  end
end
