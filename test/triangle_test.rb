require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/triangle'

class TriangleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    p2 = Point.new(0, 4)
    p3 = Point.new(3, 0)
    p4 = Point.new(4, 0)
    p5 = Point.new(0, 3)
    [p1, p2, p3, p4, p5]
  end

  def test_point1_not_point_error
    _, p2, p3, = setup
    error = assert_raises(StandardError) { Triangle.new([0, 0], p2, p3) }
    assert_equal('point1 is not a Point', error.message)
  end

  def test_point2_not_point_error
    p1, _, p3, = setup
    error = assert_raises(StandardError) { Triangle.new(p1, [0, 4], p3) }
    assert_equal('point2 is not a Point', error.message)
  end

  def test_point3_not_point_error
    p1, p2, = setup
    error = assert_raises(StandardError) { Triangle.new(p1, p2, [0, 3]) }
    assert_equal('point3 is not a Point', error.message)
  end

  def test_pts_cant_share_x_error
    p1, p2, _, _, p5 = setup
    error = assert_raises(StandardError) { Triangle.new(p1, p2, p5) }
    assert_equal('points should not all share x value', error.message)
  end

  def test_pts_cant_share_y_error
    p1, _, p3, p4, = setup
    error = assert_raises(StandardError) { Triangle.new(p1, p3, p4) }
    assert_equal('points should not all share y value', error.message)
  end

  def test_get_points
    p1, p2, p3, = setup
    t_points = Triangle.new(p1, p2, p3).points
    assert(p1 == t_points[0] && p2 == t_points[1] && p3 == t_points[2], 'Points should be equal')
  end

  def test_get_area
    p1, p2, p3, = setup
    t = Triangle.new(p1, p2, p3)
    assert(t.area == 6, "area should be 6, was #{t.area}")
  end
end
