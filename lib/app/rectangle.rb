# frozen_string_literal: true

require_relative './point'

# This class represents a rectangle using two points.
class Rectangle
  def initialize(point1, point2)
    # First make sure that point1 and point2 are point objects...
    raise StandardError, 'point1 is not a Point' unless point1.is_a?(Point)
    raise StandardError, 'point2 is not a Point' unless point2.is_a?(Point)
    # Next make sure that the two points are not equal (don't share x and y values)
    raise StandardError, 'points cannot be equal' unless point1 != point2
    # Next make sure that the points are not a straight line, because otherwise that gets complicated
    raise StandardError, 'points should not share x value' if point1.x == point2.x
    raise StandardError, 'points should not share y value' if point1.y == point2.y

    @points = [point1, point2]
  end

  attr_reader :points

  def area
    # Formula for a rectangle is the length of the x axis multiplied by the length of the y axis
    (@points[0].x - @points[1].x).abs * (@points[0].y - @points[1].y).abs
  end
end
