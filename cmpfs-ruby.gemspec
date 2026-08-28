# ######################################################################## #
# File:     cmpfs-ruby.gemspec
#
# Purpose:  Gemspec for cmpfs.Ruby library
#
# Created:  1st March 2019
# Updated:  28th August 2026
#
# ######################################################################## #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'cmpfs/version'


PROJECT_URL = 'https://github.com/synesissoftware/cmpfs.Ruby'


Gem::Specification.new do |spec|

  spec.name         = 'cmpfs-ruby'
  spec.summary      = 'Compare File-System entities, for Ruby'
  spec.version      = CmpFS::VERSION
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
  spec.homepage     = PROJECT_URL
  spec.license      = 'BSD-3-Clause'

  spec.required_ruby_version = [ '>= 1.9.3' ]

  spec.metadata = {
    'bug_tracker_uri' => "#{PROJECT_URL}/issues",
    'changelog_uri' => "#{PROJECT_URL}/blob/master/CHANGES.md",
    'homepage_uri' => PROJECT_URL,
    'source_code_uri' => PROJECT_URL,
  }

  spec.files = Dir[
    'Rakefile',
    '{bin,examples,lib,man,spec,test}/**/*',
    'AUTHORS*',
    'CHANGES*',
    'CONTRIBUTING*',
    'EXAMPLES*',
    'FAQ*',
    'INSTALL*',
    'LICENSE*',
    'NEWS*',
    'README*',
    'SECURITY*',
    'TODO*',
  ] & `git ls-files -z`.split("\0")
  spec.files -= [
    '.ruby-version',
    'Gemfile.lock',
  ]

  spec.add_development_dependency 'xqsr3', [ '>= 0.39.5', '< 1.0' ]
end


# ############################## end of file ############################# #
