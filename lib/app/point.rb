class Point
  def initialize(x_value, y_value)
    # Ratings
    @x = x_value.to_f
    @y = y_value.to_f
  end

  attr_reader :x, :y

  def == (other)
    @x == other.x && @y == other.y
  end
end
