#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './formatter'
require_relative './page_count'

# Public: The top level object responsible for handling the parsing
#         process.
#
#         It co-ordinates accepting the inputs and notifying all the
#         objects required to build the output.
class Parser
  def initialize(filename)
    raise ArgumentError, 'a log file must be provided' if filename.nil?
    raise ArgumentError, 'that file does not exist' unless File.exist?(filename)

    self.filename = File.expand_path("../#{filename}", __FILE__)
  end

  def run
    results
  end

  private

  attr_accessor :filename

  def counts
    @counts = PageCount.new(entries).all
  end

  def entries
    File.foreach(filename)
  end

  def results
    Formatter.new(counts).to_s
  end
end

called_from_command_line = $PROGRAM_NAME == __FILE__
begin
  puts Parser.new(ARGV[0]).run if called_from_command_line
rescue StandardError => e
  warn e
end
