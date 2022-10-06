class Rectangle
  def initialize (point1, point2)
    raise StandardError, 'point1 is not a Point' unless point1.is_a?(Point)
    raise StandardError, 'point2 is not a Point' unless point2.is_a?(Point)
    raise StandardError, 'points cannot be equal' unless point1 != point2

    @points = [point1, point2]
  end

  attr_reader :points

  def area
    (@points[0].x - @points[1].x).abs * (@points[0].y - @points[1].y).abs
  end
end
