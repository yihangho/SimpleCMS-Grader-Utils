require 'minitest/autorun'
require 'grader-utils'

class TestParseNumber < MiniTest::Unit::TestCase
  def test_that_it_rejects_non_numbers
    assert_nil GraderUtils.parse_number("abc")
    assert_nil GraderUtils.parse_number("5a")
    assert_nil GraderUtils.parse_number("a.5")
  end

  def test_that_it_converts_positive_integer
    assert_equal GraderUtils.parse_number("5"), 5
    assert_equal GraderUtils.parse_number("5."), 5
    assert_equal GraderUtils.parse_number(" 5  "), 5
    assert_equal GraderUtils.parse_number("05"), 5
    assert_equal GraderUtils.parse_number("0"), 0
  end

  def test_that_it_converts_positive_floats
    assert_equal GraderUtils.parse_number("5.01"), 5.01
    assert_equal GraderUtils.parse_number("0.5"), 0.5
    assert_equal GraderUtils.parse_number(".5"), 0.5
  end

  def test_that_it_converts_negative_integers
    assert_equal GraderUtils.parse_number("-5"), -5
    assert_equal GraderUtils.parse_number(" -5\n"), -5
  end

  def test_that_it_converts_negative_floats
    assert_equal GraderUtils.parse_number("-5.01"), -5.01
    assert_equal GraderUtils.parse_number(" -.5\n"), -0.5
  end
end
