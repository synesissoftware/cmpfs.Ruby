#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')

require 'cmpfs'

require 'xqsr3/extensions/test/unit'
require 'test/unit'

require 'stringio'
require 'tempfile'


class Test_CmpFS_compare_text < Test::Unit::TestCase

  include ::CmpFS

  def test__compare_text__empty

    lhs     = StringIO.new
    rhs_eq  = StringIO.new

    assert compare_text(lhs, rhs_eq), 'streams should be the same'
  end

  def test__compare_text__blank_lines

    lhs = StringIO.new <<END_OF_INPUT


END_OF_INPUT
    rhs_eq  = StringIO.new <<END_OF_INPUT


END_OF_INPUT

    assert compare_text(lhs, rhs_eq), 'streams should be the same'
  end

  def test__compare_text__identical_lines_1

    lhs     = StringIO.new <<END_OF_INPUT
line-1
line-2

END_OF_INPUT
    rhs_eq  = StringIO.new <<END_OF_INPUT
line-1
line-2

END_OF_INPUT

    assert compare_text(lhs, rhs_eq), 'streams should be the same'
  end

  def test__compare_text__different_lines_1

    lhs     = StringIO.new <<END_OF_INPUT
line-1
line-2

END_OF_INPUT
    rhs_ne  = StringIO.new <<END_OF_INPUT
line-1
line2

END_OF_INPUT

    assert_false compare_text(lhs, rhs_ne), 'streams should not be the same'
  end

  def test__compare_text__different_lines_2

    lhs     = StringIO.new <<END_OF_INPUT
line-1

line-2
END_OF_INPUT
    rhs_ne  = StringIO.new <<END_OF_INPUT
line-1
line-2

END_OF_INPUT

    assert_false compare_text(lhs, rhs_ne), 'streams should not be the same'
  end

  def test__compare_text__different_streams_with_permutations_of_trim_and_skip_1

    lhs     = StringIO.new <<END_OF_INPUT
line-1

  line-2
END_OF_INPUT
    rhs_eq  = StringIO.new <<END_OF_INPUT
line-1
line-2
END_OF_INPUT

    assert_false compare_text(lhs, rhs_eq), 'streams should not be the same'
    assert_false compare_text(lhs, rhs_eq, trim_lines: false, skip_blank_lines: true), 'streams should not be the same'
    assert_false compare_text(lhs, rhs_eq, trim_lines: true, skip_blank_lines: false), 'streams should not be the same'
    assert compare_text(lhs, rhs_eq, trim_lines: true, skip_blank_lines: true), 'streams should be the same'

    rhs_ne  = StringIO.new <<END_OF_INPUT
line-1
line2
END_OF_INPUT

    assert_false compare_text(lhs, rhs_ne), 'streams should not be the same'
    assert_false compare_text(lhs, rhs_ne, trim_lines: false, skip_blank_lines: true), 'streams should not be the same'
    assert_false compare_text(lhs, rhs_ne, trim_lines: true, skip_blank_lines: false), 'streams should not be the same'
    assert_false compare_text(lhs, rhs_ne, trim_lines: true, skip_blank_lines: true), 'streams should not be the same'
  end
end


# ############################## end of file ############################# #

