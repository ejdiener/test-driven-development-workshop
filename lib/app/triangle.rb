require_relative './point'

class Triangle
  def initialize (point1, point2, point3)
    raise StandardError, 'point1 is not a Point' unless point1.is_a?(Point)
    raise StandardError, 'point2 is not a Point' unless point2.is_a?(Point)
    raise StandardError, 'point3 is not a Point' unless point3.is_a?(Point)
    raise StandardError, 'points cannot be equal' unless point1 != point2 && point2 != point3 && point3 != point1

    @points = [point1, point2, point3]
  end

  attr_reader :points

  def area
    p1 = @points[0]
    p2 = @points[1]
    p3 = @points[2]
    ((p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * (p1.y - p2.y)).to_f.abs / 2)
  end

end
