require 'test_helper'
require_relative '../lib/app/point'
require_relative '../lib/app/rectangle'
require_relative '../lib/app/triangle'
require_relative '../lib/app/circle'
require_relative '../lib/app/scene'

class SceneTest < Minitest::Test
  def setup
    p1 = Point.new(0, 0)
    r = Rectangle.new(p1, Point.new(2, 3))
    t = Triangle.new(p1, Point.new(0, 4), Point.new(3, 0))
    c = Circle.new(p1, 1)
    [r, t, c]
  end

  def test_should_return_rectangle_count
    r, = setup
    s = new Scene(r)
    assert(s.r_count == 1, "Rectangle count should be 1 because rectangle hasn't been added, was #{s.r_count}")
  end

  def test_should_return_triangle_count
    _, t, = setup
    s = new Scene(t)
    assert(s.t_count == 1, "Triangle count should be 1, was #{s.t_count}")
  end

  def test_should_return_circle_count
    _, _, c = setup
    s = new Scene(c)
    assert(s.c_count == 1, "Circle count should be 1, was #{s.c_count}")
  end

  def test_should_return_shape_count

  end

  def teardown
    # Do nothing
  end

  def test
    skip 'Not implemented'
  end
end
