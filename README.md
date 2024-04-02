# cmpfs.Ruby <!-- omit in toc -->

**Com**pare **F**ile-**S**ystem entities, for **Ruby**

[![Gem Version](https://badge.fury.io/rb/cmpfs-ruby.svg)](https://badge.fury.io/rb/cmpfs-ruby)


## Introduction

Provides platform-independent facilities for comparing file contents, for both binary and text files


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Components](#components)
- [Examples](#examples)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
  - [Related projects](#related-projects)
  - [License](#license)


## Installation

Install using `gem install cmpfs-ruby` or add it to your `Gemfile`.


## Components

The primary components provided are the functions:

* `CmpFS::Compare.compare_binary_files()`
* `CmpFS::Compare.compare_binary_streams()`
* `CmpFS::Compare.compare_binary()`
* `CmpFS::Compare.compare_text_files()`
* `CmpFS::Compare.compare_text_streams()`
* `CmpFS::Compare.compare_text()`

all of which are obtained when `extend`ing or `include`ing the `CmpFS` module.


## Examples

**examples/compare_two_binary_files.rb**:
```Ruby
#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../lib')


require 'cmpfs'


include CmpFS


# command-line handling

lhs_path, rhs_path =
case ARGV.size
when 0, 1

  if '--help' == ARGV[0]

    $stdout.puts "#$0: <lhs-path> <rhs-path>"

    exit 0
  end

  abort "#$0: not enough arguments; use --help for usage"
when 2

  ARGV[0..2]
else

  abort "#$0: too many arguments; use --help for usage"
end


# main()


$stdout.puts "binary comparison of '#{lhs_path}' with '#{rhs_path}':"

$stdout.puts "files are #{compare_binary(lhs_path, rhs_path) ? '' : 'not '}equal"


# ############################## end of file ############################# #
```

**examples/compare_two_text_files.rb**:
```Ruby
#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../lib')


require 'cmpfs'


include CmpFS


# command-line handling

lhs_path, rhs_path =
case ARGV.size
when 0, 1

  if '--help' == ARGV[0]

    $stdout.puts "#$0: <lhs-path> <rhs-path>"

    exit 0
  end

  abort "#$0: not enough arguments; use --help for usage"
when 2

  ARGV[0..2]
else

  abort "#$0: too many arguments; use --help for usage"
end


# main()


$stdout.puts "text comparison of '#{lhs_path}' with '#{rhs_path}':"

$stdout.puts "files are #{compare_text(lhs_path, rhs_path, skip_blank_lines: true, trim_lines: true) ? '' : 'not '}equal"


# ############################## end of file ############################# #
```


## Project Information

### Where to get help

[GitHub Page](https://github.com/synesissoftware/cmpfs.Ruby "GitHub Page")


### Contribution guidelines

Defect reports, feature requests, and pull requests are welcome on https://github.com/synesissoftware/cmpfs.Ruby.


### Dependencies


### Related projects

T.B.C.


### License

**cmpfs.Ruby** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->

