#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')

require 'cmpfs'

require 'xqsr3/extensions/test/unit'
require 'test/unit'

require 'stringio'
require 'tempfile'

class Test_CmpFS_compare_text < Test::Unit::TestCase

	include ::CmpFS

	def test_compare_text_identical_1

		lhs		=	StringIO.new
		rhs_eq	=	StringIO.new

		lhs << "line-1\n"
		rhs_eq << "line-1\n"

		lhs << "line-2\n"
		rhs_eq << "line-2\n"

		assert compare_text(lhs, rhs_eq), 'streams should be the same'

		rhs_ne	=	StringIO.new

		rhs_ne << "line-1\n"
		rhs_ne << "line2\n"

		assert_false compare_text(lhs, rhs_ne), 'streams should not be the same'
	end

	def test_compare_text_same_with_blank_lines_1

		lhs		=	StringIO.new
		rhs_eq	=	StringIO.new

		lhs << "line-1\n"
		lhs << "\n"
		rhs_eq << "line-1\n"

		lhs << " line-2\n"
		rhs_eq << "line-2\n"

		assert_false compare_text(lhs, rhs_eq), 'streams should not be the same'
		assert compare_text(lhs, rhs_eq, trim_lines: true, skip_blank_lines: true), 'streams should be the same'

		rhs_ne	=	StringIO.new

		rhs_ne << "line-1\n"
		rhs_ne << "line2\n"

		assert_false compare_text(lhs, rhs_ne), 'streams should not be the same'
	end

end

# ############################## end of file ############################# #


