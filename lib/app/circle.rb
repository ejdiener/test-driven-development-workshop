# frozen_string_literal: true
require_relative './point'

# This class represents a circle using a point for the center and a radius.
class Circle
  def initialize(point, radius, id)
    # First make sure that point is a point object...
    raise StandardError, 'point is not a Point' unless point.is_a?(Point)
    # Next make sure that radius is a number...
    raise StandardError, 'radius is not a number' unless radius.is_a?(Float) || radius.is_a?(Integer)

    @id = id
    @point = point
    @radius = radius.abs.to_f
  end

  attr_reader :point, :radius, :id

  def area
    # The formula for a circle is pi * r**2
    Math::PI * @radius**2
  end
end
