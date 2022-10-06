require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/rectangle'

class RectangleTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    p2 = Point.new(2, 3)
    r = Rectangle.new(p1, p2, 'A')
    [p1, p2, r]
  end

  def test_point1_not_point_error
    error = assert_raises(StandardError) { Rectangle.new([0, 0], Point.new(2, 3), 'A') }
    assert_equal('point1 is not a Point', error.message)
  end

  def test_point2_not_point_error
    error = assert_raises(StandardError) { Rectangle.new(Point.new(0, 0), [2, 3], 'A') }
    assert_equal('point2 is not a Point', error.message)
  end

  def test_pts_cant_be_equal_error
    error = assert_raises(StandardError) { Rectangle.new(Point.new(0, 0), Point.new(0, 0), 'A') }
    assert_equal('points cannot be equal', error.message)
  end

  def test_pts_cant_share_x_error
    error = assert_raises(StandardError) { Rectangle.new(Point.new(0, 0), Point.new(0, 3), 'A') }
    assert_equal('points should not share x value', error.message)
  end

  def test_pts_cant_share_y_error
    error = assert_raises(StandardError) { Rectangle.new(Point.new(0, 0), Point.new(2, 0), 'A') }
    assert_equal('points should not share y value', error.message)
  end

  def test_get_points
    p1, p2, r = setup
    r_points = r.points
    assert(p1 == r_points[0] && p2 == r_points[1], 'Points should be equal')
  end

  def test_get_area
    _, _, r = setup
    assert(r.area == 6, "area should be 6, was #{r.area}")
  end
end
