require 'minitest/autorun'
require 'grader-utils'

class TestParseBoolean < MiniTest::Unit::TestCase
  def test_that_it_accepts_boolean_literal
    assert GraderUtils.parse_boolean(true)
    refute GraderUtils.parse_boolean(false)
  end

  def test_that_it_accepts_printed_boolean_literal
    assert GraderUtils.parse_boolean("True")
    refute GraderUtils.parse_boolean("False")
  end

  def test_that_it_accepts_boolean_strings
    # i.e., print "true"
    assert GraderUtils.parse_boolean("'True'")
    refute GraderUtils.parse_boolean("'False'")
  end
end
