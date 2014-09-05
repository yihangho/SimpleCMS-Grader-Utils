require 'minitest/autorun'
require 'grader-utils'

class TestParseArray < MiniTest::Unit::TestCase
  def test_that_it_accepts_array_with_square_brackets
    assert_equal GraderUtils.parse_array("[1,2,3]"), ["1", "2", "3"]
    assert_equal GraderUtils.parse_array("['1',2,3]"), ["'1'", "2", "3"]
  end

  def test_that_it_accepts_array_without_square_brackets
    assert_equal GraderUtils.parse_array("1,2,3"), ["1", "2", "3"]
    assert_equal GraderUtils.parse_array("'1',2,3"), ["'1'", "2", "3"]
  end

  def test_that_it_ignores_white_spaces
    assert_equal GraderUtils.parse_array("1,  2,  3"), ["1", "2", "3"]
    assert_equal GraderUtils.parse_array("[   '1',   2,   3\n]"), ["'1'", "2", "3"]
  end
end
