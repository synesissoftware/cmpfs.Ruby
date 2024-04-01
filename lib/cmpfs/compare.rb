
# ######################################################################## #
# File:     cmpfs/version.rb
#
# Purpose:  Version for cmpfs.Ruby library
#
# Created:  1st March 2019
# Updated:  1st April 2024
#
# Home:     http://github.com/synesissoftware/cmpfs.Ruby
#
# Author:   Matthew Wilson
#
# Copyright (c) 2019-2024, Matthew Wilson and Synesis Information Systems
# Copyright (c) 2019, Matthew Wilson and Synesis Software
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ######################################################################## #


if RUBY_VERSION >= '2'

  require 'cmpfs/compare/api_2'
else

  require 'cmpfs/compare/api_1_9'
end


=begin
=end

module CmpFS

# The comparison module, which may be used directly, and which may be
# extended or included
#
# Important functions:
#
# - +CmpFS::Compare.compare_binary_files()+
# - +CmpFS::Compare.compare_binary_streams()+
# - +CmpFS::Compare.compare_binary()+
#
# - +CmpFS::Compare.compare_text_files()+
# - +CmpFS::Compare.compare_text_streams()+
# - +CmpFS::Compare.compare_text()+
#
#
module Compare

  def self.extended receiver

    receiver.class_eval do

      extend CmpFS_Compare_Methods
    end

    $stderr.puts "#{receiver} extended by #{CmpFS_Compare_Methods}" if $DEBUG
  end

  def self.included receiver

    receiver.class_eval do

      include CmpFS_Compare_Methods
    end

    $stderr.puts "#{receiver} included #{CmpFS_Compare_Methods}" if $DEBUG
  end

  extend CmpFS_Compare_Methods
  include CmpFS_Compare_Methods

end # module Compare
end # module CmpFS


# ############################## end of file ############################# #

