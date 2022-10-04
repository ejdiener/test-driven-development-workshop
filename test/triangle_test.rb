require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/triangle'

class TriangleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    p2 = Point.new(0, 4)
    p3 = Point.new(3, 0)
    t = Triangle.new(p1, p2, p3)
    [p1, p2, p3, t]
  end

  def test_get_points
    p1, p2, p3, t = setup
    t_points = t.points
    assert(p1 == t_points[0] && p2 == t_points[1] && p3 == t_points[2], 'Points should be equal')
  end

  def test_get_area
    _, _, _, t = setup
    assert(t.area == 6, 'area should be 6')
  end
end
