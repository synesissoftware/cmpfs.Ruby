#!  /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')

require 'cmpfs/version'

require 'xqsr3/extensions/test/unit'
require 'test/unit'

class Test_version < Test::Unit::TestCase

  def test__VERSION

    assert defined? CmpFS::VERSION
  end

  def test__VERSION_MAJOR

    assert defined? CmpFS::VERSION_MAJOR
  end

  def test__VERSION_MINOR

    assert defined? CmpFS::VERSION_MINOR
  end

  def test__VERSION_REVISION

    assert defined? CmpFS::VERSION_REVISION
  end

  def test__VERSION_has_consistent_format

    version = CmpFS::VERSION
    j_n_p   = "#{CmpFS::VERSION_MAJOR}.#{CmpFS::VERSION_MINOR}.#{CmpFS::VERSION_PATCH}"

    assert_match /^#{j_n_p}(|\..+)$/, version
  end
end

