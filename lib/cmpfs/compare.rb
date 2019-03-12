
#require 'xqsr3'

require 'fileutils'
require 'stringio'

module CmpFS

	module Internal_CmpFS_compare_binary_

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
	end # module Internal_CmpFS_compare_binary_

	def self.compare_binary_files lhs_path, rhs_path, **options

		FileUtils.compare_file lhs_path, rhs_path
	end

	def self.compare_binary_streams lhs_stm, rhs_stm, **options

		FileUtils.compare_stream lhs_stm, rhs_stm
	end

	def self.compare_binary lhs, rhs, **options

		lhs_type	=	Internal_CmpFS_compare_binary_.determine_param_type_ lhs
		rhs_type	=	Internal_CmpFS_compare_binary_.determine_param_type_ rhs

		raise ArgumentError, "lhs is of unsupported type '#{lhs.class}'" unless lhs_type
		raise ArgumentError, "rhs is of unsupported type '#{rhs.class}'" unless rhs_type

		if lhs_type == rhs_type

			case lhs_type
			when :io

				return self.compare_binary_streams lhs, rhs, **options
			when :path

				return self.compare_binary_files lhs, rhs, **options
			end
		else

			case lhs_type
			when :io

				if :path == rhs_type

					File.open(rhs, 'rb') do |rhs_f|

						return self.compare_binary_streams lhs, rhs_f, **options
					end
				end
			when :path

				if :path == lhs_type

					File.open(lhs, 'rb') do |lhs_f|

						return self.compare_binary_streams lhs_f, rhs, **options
					end
				end
			end
		end

		warn "#{__method__}: incompatible types (#{lhs.type}, #{rhs.type})"

		nil
	end

end # module CmpFS

