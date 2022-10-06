class Scene
  def initialize(shape = nil)
    @shapes = {}
    @shape_count = 0
    return if shape.nil?

    add_shape(shape)
  end

  attr_reader :shape_count

  def add_shape(shape)
    raise StandardError, 'shape is nil' if shape.nil?
    unless shape.is_a?(Rectangle) || shape.is_a?(Triangle) || shape.is_a?(Circle)
      raise StandardError, 'shape is an object other than a circle, rectangle, or triangle'
    end

    @shapes.append(shape)
    @shape_count += 1
  end

  def total_area
    area = 0
    @shapes.each do |shape|
      area += shape.area
    end
    area
  end
end
