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

