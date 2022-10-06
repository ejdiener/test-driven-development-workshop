# frozen_string_literal: true
require_relative './point'

# This class represents a circle using a point for the center and a radius.
class Circle
  def initialize(point, radius)
    raise StandardError, 'point is not a Point' unless point.is_a?(Point)
    raise StandardError, 'radius is not a number' unless radius.is_a?(Float) || radius.is_a?(Integer)

    @point = point
    @radius = radius.abs.to_f
  end

  attr_reader :point, :radius

  def area
    # The formula for a circle is pi * r**2
    Math::PI * @radius**2
  end
end
