# frozen_string_literal: true

require_relative './point'

# This class represents a triangle using three points.
class Triangle
  def initialize(point1, point2, point3, id)
    check_points_are_points(point1, point2, point3)
    check_points_are_not_equal(point1, point2, point3)
    check_points_not_one_line(point1, point2, point3)
    @id = id
    @points = [point1, point2, point3]
  end

  attr_reader :points

  def area
    p1 = @points[0]
    p2 = @points[1]
    p3 = @points[2]
    ((p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * (p1.y - p2.y)).to_f.abs / 2)
  end

  def check_points_are_points(point1, point2, point3)
    # First make sure that point1, point2, and point3 are point objects...
    raise StandardError, 'point1 is not a Point' unless point1.is_a?(Point)
    raise StandardError, 'point2 is not a Point' unless point2.is_a?(Point)
    raise StandardError, 'point3 is not a Point' unless point3.is_a?(Point)
  end

  def check_points_are_not_equal(point1, point2, point3)
    # Next make sure that no two points are equal (don't share x and y values)
    raise StandardError, 'points cannot be equal' if point1 == point2 || point2 == point3 || point3 == point1
  end

  def check_points_not_one_line(point1, point2, point3)
    # Next make sure that the points are not all one straight line
    raise StandardError, 'points should not all share x value' if point1.x == point2.x && point2.x == point3.x
    raise StandardError, 'points should not all share y value' if point1.y == point2.y && point2.y == point3.y
  end
end
