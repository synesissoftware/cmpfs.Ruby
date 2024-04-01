# ######################################################################### #
# File:     cmpfs.gemspec
#
# Purpose:  Gemspec for cmpfs.Ruby library
#
# Created:  1st March 2019
# Updated:  1st April 2024
#
# ######################################################################### #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'cmpfs'

require 'date'

Gem::Specification.new do |spec|

  spec.name         = 'cmpfs-ruby'
  spec.version      = CmpFS::VERSION
  spec.date         = Date.today.to_s
  spec.summary      = 'CmpFS.Ruby'
  spec.description  = <<END_DESC
Compare File-System entities, for Ruby is a library that provides comparison
functions for file-system entities - files and streams - including binary and
filtering textual comparisons.
END_DESC
  spec.authors      = [ 'Matt Wilson' ]
  spec.email        = 'matthew@synesis.com.au'
  spec.homepage     = 'http://github.com/synesissoftware/cmpfs.Ruby'
  spec.license      = 'BSD 3-Clause'
  spec.files        = Dir[ 'Rakefile', '{bin,examples,lib,man,spec,test}/**/*', 'README*', 'LICENSE*' ] & `git ls-files -z`.split("\0")

  if RUBY_VERSION >= '2'

    spec.required_ruby_version = '~> 2.0'
  else

    spec.required_ruby_version = [ '~> 1.9', '>= 1.9.3' ]
  end

  spec.add_development_dependency 'xqsr3', [ '~> 0.39', '>= 0.39.1' ]
end


# ############################## end of file ############################# #

