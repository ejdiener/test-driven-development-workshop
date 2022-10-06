# frozen_string_literal: true

require_relative './point'

# This class represents a triangle using three points.
# I had to break down so much for rubocop, and I think it made it less readable.
# But I didn't want to get my assignment back and have it say that I ignored rubocop.
class Triangle
  def initialize(point1, point2, point3, id)
    check_points_are_points(point1, point2, point3)
    check_points_are_not_equal(point1, point2, point3)
    check_points_not_one_line(point1, point2, point3)
    @id = id
    @points = [point1, point2, point3]
  end

  attr_reader :points, :id

  def area
    # rubocop wouldn't let me put in just the formula, first because it was too long, then because it was "unreadable"
    broken_down_for_rubocop1, broken_down_for_rubocop2, broken_down_for_rubocop3 = broke_down_formula_for_rubocop
    (broken_down_for_rubocop1 + broken_down_for_rubocop2 + broken_down_for_rubocop3).to_f.abs / 2
  end

  def broke_down_formula_for_rubocop
    # is this more readable, rubocop?
    # apparently not, because it wanted me to break it down even further...
    # your wish is my command, rubocop
    broken_down_for_rubocop1 = x_times_y_minus_y(@points[0], @points[1], @points[2])
    broken_down_for_rubocop2 = x_times_y_minus_y(@points[1], @points[2], @points[0])
    broken_down_for_rubocop3 = x_times_y_minus_y(@points[2], @points[0], @points[1])
    [broken_down_for_rubocop1, broken_down_for_rubocop2, broken_down_for_rubocop3]
  end

  def x_times_y_minus_y(point1, point2, point3)
    # finally, no more rubocop notifications...
    point1.x * (point2.y - point3.y)
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
