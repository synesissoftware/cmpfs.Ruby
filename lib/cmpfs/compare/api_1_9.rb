
if RUBY_VERSION >= '2'

  abort "This file required Ruby 1+: RUBY_VERSION='#{RUBY_VERSION}'"
end

require 'cmpfs/compare/binary/internal_'
require 'cmpfs/compare/text/internal_'


module CmpFS
module Compare

module CmpFS_Compare_Methods

  # Compares two files, named by +lhs_path+ and +rhs_path+, in a binary
  # (exact) manner
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs_path+:: (+String+) The name of a file
  #   - +rhs_path+:: (+String+) The name of a file
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #
  # === Return
  # +true+ if the files have exactly the same content; +false+ otherwise.
  def compare_binary_files lhs_path, rhs_path, options = {}

    options ||= {}

    ::CmpFS::Compare::Binary::Internal_.compare_binary_files_ lhs_path, rhs_path, options
  end

  # Compares two streams, +lhs_stm+ and +rhs_stm+, in a binary
  # (exact) manner
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs_stm+:: (stream) A stream object
  #   - +rhs_stm+:: (stream) A stream object
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #   - +:no_rewind+:: (boolean) Prevents the default behaviour of rewinding each stream before processing
  #
  # === Return
  # +true+ if the streams have exactly the same content; +false+ otherwise.
  def compare_binary_streams lhs_stm, rhs_stm, options = {}

    options ||= {}

    ::CmpFS::Compare::Binary::Internal_.compare_binary_streams_ lhs_stm, rhs_stm, options
  end

  # Compares two files/streams in a binary (exact) manner
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs+:: (+String+, stream) The name of a file, or a stream object
  #   - +rhs+:: (+String+, stream) The name of a file, or a stream object
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #   - +:no_rewind+:: (boolean) Prevents the default behaviour of rewinding each stream before processing
  #
  # === Return
  # +true+ if the files/streams have exactly the same content; +false+
  # otherwise.
  def compare_binary lhs, rhs, options = {}

    options ||= {}

    ::CmpFS::Compare::Binary::Internal_.compare_binary_ lhs, rhs, options
  end


  # Compares two files, named by +lhs_path+ and +rhs_path+, in a textual
  # manner according to the given +options+.
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs_path+:: (+String+) The name of a file
  #   - +rhs_path+:: (+String+) The name of a file
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #   - +:skip_blank_lines+:: (boolean) Determines whether blank lines should be skipped from the comparison
  #   - +:trim_lines+:: (boolean) Determines whether lines should be trimmed of leading and trailing space (including EOL sequence)
  #
  # === Return
  # +true+ if the files/streams have the same content; +false+ otherwise.
  def compare_text_files lhs_path, rhs_path, options = {}

    options |= {}

    ::CmpFS::Compare::Text::Internal_.compare_text_files_ lhs_path, rhs_path, options
  end

  # Compares two streams, +lhs_stm+ and +rhs_stm+, in a textual
  # manner according to the given +options+.
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs_stm+:: (stream) A stream object
  #   - +rhs_stm+:: (stream) A stream object
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #   - +:no_rewind+:: (boolean) Prevents the default behaviour of rewinding each stream before processing
  #   - +:skip_blank_lines+:: (boolean) Determines whether blank lines should be skipped from the comparison
  #   - +:trim_lines+:: (boolean) Determines whether lines should be trimmed of leading and trailing space (including EOL sequence)
  #
  # === Return
  # +true+ if the files/streams have the same content; +false+ otherwise.
  def compare_text_streams lhs_stm, rhs_stm, options = {}

    options ||= {}

    ::CmpFS::Compare::Text::Internal_.compare_text_streams_ lhs_stm, rhs_stm, options
  end

  # Compares two files/streams, +lhs+ and +rhs+, in a textual
  # manner according to the given +options+.
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +lhs+:: (+String+, stream) The name of a file, or a stream object
  #   - +rhs+:: (+String+, stream) The name of a file, or a stream object
  #   - +options+:: (+Hash+) Options that control the behaviour of the method
  #
  # * *Options:*
  #   - +:no_rewind+:: (boolean) Prevents the default behaviour of rewinding each stream before processing
  #   - +:skip_blank_lines+:: (boolean) Determines whether blank lines should be skipped from the comparison
  #   - +:trim_lines+:: (boolean) Determines whether lines should be trimmed of leading and trailing space (including EOL sequence)
  #
  # === Return
  # +true+ if the files/streams have the same content; +false+ otherwise.
  def compare_text lhs, rhs, options = {}

    options ||= {}

    ::CmpFS::Compare::Text::Internal_.compare_text_ lhs, rhs, options
  end
end # module CmpFS_Compare_Methods
end # module Compare
end # module CmpFS


# ############################## end of file ############################# #

