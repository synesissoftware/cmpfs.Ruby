#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../../lib')

require 'cmpfs/compare'

require 'xqsr3/extensions/test/unit'
require 'test/unit'

require 'stringio'
require 'tempfile'


class Test_CmpFS_Compare_compare_binary < Test::Unit::TestCase

  def test__compare_binary__identical_1

    lhs		=	StringIO.new 'abcdefghijiklmno'
    rhs_eq	=	StringIO.new 'abcdefghijiklmno'

    assert CmpFS::Compare.compare_binary(lhs, rhs_eq), 'streams should be the same'

    rhs_ne	=	StringIO.new 'abcdefghijiklmn'

    assert_false CmpFS::Compare.compare_binary(lhs, rhs_ne), 'streams should not be the same'
  end

  def test__compare_binary__identical_2

    lhs_f = Tempfile.new('compare_binary-2')

    begin

      lhs_f << 'abcdefghijiklmno'

      lhs_f.rewind
      lhs_f.close

      rhs_eq	=	StringIO.new 'abcdefghijiklmno'

      assert CmpFS::Compare.compare_binary(lhs_f.path, rhs_eq), 'streams should be the same'

      rhs_ne	=	StringIO.new 'abcdefghijiklmnop'

      assert_false CmpFS::Compare.compare_binary(lhs_f.path, rhs_ne), 'streams should not be the same'
    ensure

      lhs_f.unlink
    end
  end

  def test__compare_binary__identical_3

    lhs_f = Tempfile.new('compare_binary-3')

    begin

      lhs_f << 'abcdefghijiklmno'

      lhs_f.rewind
      lhs_f.close


      rhs_eq_f = Tempfile.new('compare_binary-3')

      begin

        rhs_eq_f << 'abcdefghijiklmno'

        rhs_eq_f.rewind
        rhs_eq_f.close

        assert CmpFS::Compare.compare_binary(lhs_f.path, rhs_eq_f.path), 'streams should be the same'
      ensure

        rhs_eq_f.unlink
      end


      rhs_ne_f = Tempfile.new('compare_binary-3')

      begin

        rhs_ne_f << 'xyz'

        rhs_ne_f.rewind
        rhs_ne_f.close

        assert_false CmpFS::Compare.compare_binary(lhs_f.path, rhs_ne_f.path), 'streams should not be the same'
      ensure

        rhs_ne_f.unlink
      end

    ensure

      lhs_f.unlink
    end
  end
end


# ############################## end of file ############################# #

