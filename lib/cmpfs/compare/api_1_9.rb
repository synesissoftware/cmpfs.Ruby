
if RUBY_VERSION >= '2'

	abort "This file required Ruby 1+: RUBY_VERSION='#{RUBY_VERSION}'"
end

require 'cmpfs/compare/binary/internal_'

module CmpFS
module Compare

module CmpFS_Compare_Methods

	# Compares two files, named by +lhs_path+ and +rhs_path+, in a binary
	# (exact) manner
	def compare_binary_files lhs_path, rhs_path, options = {}

		options ||= {}

		::CmpFS::Compare::Binary::Internal_.compare_binary_files_ lhs_path, rhs_path, options
	end

	# Compares two streams, +lhs_stm+ and +rhs_stm+, in a binary
	# (exact) manner
	def compare_binary_streams lhs_stm, rhs_stm, options = {}

		options ||= {}

		::CmpFS::Compare::Binary::Internal_.compare_binary_streams_ lhs_stm, rhs_stm, options
	end

	# Compares two files/streams in a binary (exact) manner
	#
	# == Signature
	#
	# == Return
	#
	# +true+ if the files/streams have exactly the same content; +false+
	# otherwise.
	def compare_binary lhs, rhs, options = {}

		options ||= {}

		::CmpFS::Compare::Binary::Internal_.compare_binary_ lhs, rhs, options
	end
end # module CmpFS_Compare_Methods
end # module Compare
end # module CmpFS

# ############################## end of file ############################# #


