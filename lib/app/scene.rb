require_relative './point'
require_relative './rectangle'
require_relative './triangle'
require_relative './circle'

# This class represents a layout holding multiple shpaes within.
class Scene
  def initialize(shape = nil)
    @shapes = {}
    @shape_count = 0
    return if shape.nil?

    add_shape(shape)
  end

  attr_reader :shape_count

  def add_shape(shape)
    # Check the shape the user entered is not nil...
    raise StandardError, 'shape is nil' if shape.nil?
    # Check to make sure a shape with that id doesn't already exist...
    raise StandardError, 'shape already exists' unless @shapes[shape.id].nil?
    # Check to make sure it actually is a shape...
    unless shape.is_a?(Rectangle) || shape.is_a?(Triangle) || shape.is_a?(Circle)
      raise StandardError, 'shape is an object other than a circle, rectangle, or triangle'
    end

    # Then add the shape to the hash, and increment the count
    @shapes[shape.id] = shape
    @shape_count += 1
  end

  def total_area
    area = 0
    @shapes.each do |shape|
      area += shape[1].area
    end
    area
  end

  def remove_shape(id)
    raise StandardError, 'shape does not exists' if @shapes[id].nil?

    @shapes.delete(id)
    @shape_count -= 1
  end

end
