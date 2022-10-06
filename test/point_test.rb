require 'test_helper'
require_relative '../lib/app/point'

class PointTest < Minitest::Test
  def setup
    Point.new(1, 2)
  end

  def test_should_return_x
    p = setup
    assert(p.x == 1, "Point x-value should be 1, was #{p.x}")
  end

  def test_should_return_y
    p = setup
    assert(p.y == 2, "Point y-value should be 2, was #{p.y}")
  end

  def test_should_be_equal
    p1 = setup
    p2 = Point.new(1, 2)
    assert(!p1.eql?(p2), 'Points should be different hashes')
    assert(p1 == p2, 'Points should be equal')
  end
end
