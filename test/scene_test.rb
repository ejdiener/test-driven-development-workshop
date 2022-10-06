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

  def test_should_return_shape_count
    r, t, c = setup
    sr = Scene.new(r)
    assert(sr.shape_count == 1, "Shape count should be 1, was #{sr.shape_count}")
    st = Scene.new(t)
    assert(st.shape_count == 1, "Shape count should be 1, was #{st.shape_count}")
    sc = Scene.new(c)
    assert(sc.shape_count == 1, "Shape count should be 1, was #{sc.shape_count}")
  end

  def test_should_add_shape
    r, t, c = setup
    s = Scene.new
    assert(s.shape_count == 0, "Shape count should be 0, was #{s.shape_count}")
    s.add_shape(r)
    assert(s.shape_count == 1, "Shape count should be 1, was #{s.shape_count}")
    s.add_shape(t)
    assert(s.shape_count == 2, "Shape count should be 2, was #{s.shape_count}")
    s.add_shape(c)
    assert(s.shape_count == 3, "Shape count should be 3, was #{s.shape_count}")
  end

  def test_should_return_total_area
    r, t, c = setup
    s = Scene.new(r)
    assert(s.total_area == 6, "area should be 6, was #{s.total_area}")
    s.add_shape(t)
    assert(s.total_area == 12, "area should be 12, was #{s.total_area}")
    s.add_shape(c)
    assert(s.total_area == 15.141592653589793, "area should be 15.141592653589793, was #{s.total_area}")
  end

  def test_should_remove_shape

  end



end
