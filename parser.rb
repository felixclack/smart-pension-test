#!/usr/bin/env ruby
# frozen_string_literal: true

# Public: The top level object responsible for handling the parsing
#         process.
#
#         It co-ordinates accepting the inputs and notifying all the
#         objects required to build the output.
class Parser
  def initialize(file)
    raise ArgumentError, 'a log file must be provided' if file.nil?

    self.file = file
  end

  def run; end

  private

  attr_accessor :file
end

called_from_command_line = $PROGRAM_NAME == __FILE__
Parser.new(ARGV[0]).run if called_from_command_line
