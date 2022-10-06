class Circle
  def initialize (point1, radius)
    raise StandardError, 'point1 is not a Point' unless point1.is_a?(Point)
    raise StandardError, 'radius is not a number' unless radius.is_a?(Float) || radius.is_a?(Integer)

    @point = point1
    @radius = radius.to_f
  end

  attr_reader :point, :radius

  def area
    Math::PI * @radius * @radius
  end
end
