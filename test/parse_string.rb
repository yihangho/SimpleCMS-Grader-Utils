require 'minitest/autorun'
require 'grader-utils'

class TestParseString < MiniTest::Unit::TestCase
  def test_that_it_ignores_starting_and_ending_white_spaces
    assert_equal GraderUtils.parse_string("   hello world\n\t"), "hello world"
  end

  def test_that_it_accepts_strings_without_quotes
    assert_equal GraderUtils.parse_string("hello world"), "hello world"
  end

  def test_that_it_accepts_strings_with_single_quotes
    assert_equal GraderUtils.parse_string("'hello world'"), "hello world"
  end

  def test_that_it_accepts_strings_with_double_quotes
    assert_equal GraderUtils.parse_string('"hello world"'), "hello world"
  end

  def test_that_it_properly_unescape_backslashes
    assert_equal GraderUtils.parse_string("'\\''"), "'"
    assert_equal GraderUtils.parse_string('"\\""'), '"'
    assert_equal GraderUtils.parse_string('"\\n"'), "\n"

    # Ruby string "'\\\"\\\\'" is printed as '\"\\'
    # '\"\\' -> (removing starting and ending quotes) \"\\ -> (unescape) "\
    assert_equal GraderUtils.parse_string("'\\\"\\\\'"), '"\\'
  end
end
