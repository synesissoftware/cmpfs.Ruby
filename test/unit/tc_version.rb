#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')

require 'cmpfs/version'

require 'xqsr3/extensions/test/unit'
require 'test/unit'

class Test_version < Test::Unit::TestCase

	def test_has_VERSION

		assert defined? CmpFS::VERSION
	end

	def test_has_VERSION_MAJOR

		assert defined? CmpFS::VERSION_MAJOR
	end

	def test_has_VERSION_MINOR

		assert defined? CmpFS::VERSION_MINOR
	end

	def test_has_VERSION_REVISION

		assert defined? CmpFS::VERSION_REVISION
	end

	def test_VERSION_has_consistent_format

		assert_equal CmpFS::VERSION, "#{CmpFS::VERSION_MAJOR}.#{CmpFS::VERSION_MINOR}.#{CmpFS::VERSION_PATCH}"
	end
end

