# cmpfs.Ruby <!-- omit in toc -->

**Com**pare **F**ile-**S**ystem entities, for **Ruby**

![Language](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Gem Version](https://badge.fury.io/rb/cmpfs-ruby.svg)](https://badge.fury.io/rb/cmpfs-ruby)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/cmpfs.Ruby)](https://github.com/synesissoftware/cmpfs.Ruby/commits/master)
[![Ruby](https://github.com/synesissoftware/cmpfs.Ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/synesissoftware/cmpfs.Ruby/actions/workflows/ruby.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Components](#components)
- [Examples](#examples)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
    - [Efferent (fan-out)](#efferent-fan-out)
      - [Runtime Dependencies (aka "Normal Dependencies")](#runtime-dependencies-aka-normal-dependencies)
      - [Development Dependencies](#development-dependencies)
    - [Afferent (fan-in)](#afferent-fan-in)
      - [Runtime dependents](#runtime-dependents)
      - [Development dependents](#development-dependents)
  - [Related projects](#related-projects)
  - [License](#license)


## Introduction

**cmpfs.Ruby** provides platform-independent facilities for comparing file contents, for both binary and text files.

It has **no dependencies** on any other non-standard library.


## Installation

Install via **gem** as in:

```
gem install cmpfs-ruby
```

or add it to your `Gemfile`.

Use via **require**, as in:

```Ruby
require 'cmpfs'
```


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

Examples are provided in the ```examples``` directory, along with a markdown description for each. A detailed list TOC of them is provided in [EXAMPLES.md](./EXAMPLES.md).

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


#### Efferent (fan-out)

Libraries upon which **cmpfs.Ruby** depends:


##### Runtime Dependencies (aka "Normal Dependencies")

* \<none>;


##### Development Dependencies

* [**rake**](https://rubygems.org/gems/rake);
* [**test-unit**](https://rubygems.org/gems/test-unit);
* [**xqsr3**](https://github.com/synesissoftware/xqsr3);


#### Afferent (fan-in)

Projects that depend on **cmpfs.Ruby**:


##### Runtime dependents

* \<none>;


##### Development dependents

* \<none>;


### Related projects

* C/C++ **cmpfs** — same product idea (binary/text file and stream comparison); recovery into freelibs is planned beside this gem (not yet published as a sibling tree here);


### License

**cmpfs.Ruby** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->
