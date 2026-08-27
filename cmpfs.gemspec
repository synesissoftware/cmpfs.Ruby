# ######################################################################### #
# File:     cmpfs.gemspec
#
# Purpose:  Gemspec for cmpfs.Ruby library
#
# Created:  1st March 2019
# Updated:  15th August 2026
#
# ######################################################################### #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'cmpfs/version'


Gem::Specification.new do |spec|

  spec.name         = 'cmpfs-ruby'
  spec.version      = CmpFS::VERSION
  spec.summary      = 'CmpFS.Ruby'
  spec.description  = <<END_DESC
Compare File-System entities, for Ruby is a library that provides comparison
functions for file-system entities - files and streams - including binary and
filtering textual comparisons.
END_DESC

  spec.authors      = [
    'Matt Wilson',
  ]
  spec.email        = [
    'matthew@synesis.com.au',
  ]
  spec.homepage     = 'https://github.com/synesissoftware/cmpfs.Ruby'
  spec.license      = 'BSD-3-Clause'
  spec.files        = Dir[ 'Rakefile', '{bin,examples,lib,man,spec,test}/**/*', 'README*', 'LICENSE*' ] & `git ls-files -z`.split("\0")

  spec.required_ruby_version = [ '>= 1.9.3' ]

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/synesissoftware/cmpfs.Ruby/issues',
    'changelog_uri' => 'https://github.com/synesissoftware/cmpfs.Ruby/blob/master/CHANGES.md',
    'homepage_uri' => 'https://github.com/synesissoftware/cmpfs.Ruby',
    'source_code_uri' => 'https://github.com/synesissoftware/cmpfs.Ruby',
  }

  spec.add_development_dependency "xqsr3", [ '>= 0.39.5', '< 1.0' ]
end


# ############################## end of file ############################# #
