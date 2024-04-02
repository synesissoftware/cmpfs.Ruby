
require 'fileutils'
require 'stringio'


module CmpFS
module Compare
module Text

module Internal_

    def self.determine_param_type_ p

      case p
      when ::IO, ::StringIO

        return :io
      when ::String

        return :path
      else

        return :path if p.respond_to?(:to_str)

        return nil
      end
    end

    def self.next_line_or_nil_ en, options

      skipping_blanks = options[:skip_blank_lines]
      trimming_lines  = options[:trim_lines]

      num_read = 0

      begin

        loop do

          line = en.next

          num_read += 1

          line = line.strip if trimming_lines

          if line.empty? && skipping_blanks

            next
          end

          return [ line, num_read ]
        end
      rescue StopIteration

      end

      return [ nil, num_read ]
    end

    def self.compare_text_files_ lhs_path, rhs_path, options

      File.open(lhs_path, 'r') do |lhs_stm|

        File.open(rhs_path, 'r') do |rhs_stm|

          self.compare_text_streams_ lhs_stm, rhs_stm, options.merge(no_rewind: true)
        end
      end
    end

    def self.compare_text_streams_ lhs_stm, rhs_stm, options

      lhs_en  = lhs_stm.each_line
      rhs_en  = rhs_stm.each_line

      unless options[:no_rewind]

        lhs_en.rewind if lhs_stm.respond_to?(:rewind)
        rhs_en.rewind if rhs_stm.respond_to?(:rewind)
      end

      lhs_ix  = 0
      rhs_ix  = 0

      loop do

        lhs_ln, lhs_nr  = self.next_line_or_nil_ lhs_en, options
        rhs_ln, rhs_nr  = self.next_line_or_nil_ rhs_en, options

        if lhs_ln != rhs_ln

          return false
        else

          return true if lhs_ln.nil?
        end
      end

      return true
    end

    def self.compare_text_ lhs, rhs, options

      lhs_type  = self.determine_param_type_ lhs
      rhs_type  = self.determine_param_type_ rhs

      raise ArgumentError, "lhs is of unsupported type '#{lhs.class}'" unless lhs_type
      raise ArgumentError, "rhs is of unsupported type '#{rhs.class}'" unless rhs_type

      if lhs_type == rhs_type

        case lhs_type
        when :io

          return self.compare_text_streams_ lhs, rhs, options
        when :path

          return self.compare_text_files_ lhs, rhs, options
        end
      else

        case lhs_type
        when :io

          if :path == rhs_type

            File.open(rhs, 'r') do |rhs_f|

              return self.compare_text_streams_ lhs, rhs_f, options
            end
          end
        when :path

          if :path == lhs_type

            File.open(lhs, 'r') do |lhs_f|

              return self.compare_text_streams_ lhs_f, rhs, options
            end
          end
        end
      end

      warn "#{__method__}: incompatible types (#{lhs.type}, #{rhs.type})"

      nil
    end
end # module Internal_

end # module Text
end # module Compare
end # module CmpFS


# ############################## end of file ############################# #

