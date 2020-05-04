# frozen_string_literal: true

# Public: Given an array of log entries, calculate the different
#         ways we want to count page views.
#
#         The parent is responsible for handling the empty case so
#         this object can be confident that there is something to
#         count.
#
#         This leaves this class to be concerned about counting total page
#         views and also unique counts.
#
#         It is not responsible for the output format, as that is handled
#         by another object.
class PageCount
  # Public: Accepts an array of entries from a log file.
  #
  # entries - An array of Strings where each string contains space separated
  #           values for the path and the IP address that visited it.
  #           eg. "/home 127.0.0.1"
  #
  # Returns an instance of PageCount
  def initialize(entries)
    raise ArgumentError, 'entries is nil' if entries.nil?

    self.entries = entries
  end

  # Public: Return an array of all paths and their counts.
  #
  # Returns Array
  def all
    total_counts.to_a
  end

  private

  attr_accessor :entries

  def total_counts
    @total_counts ||= entries.each_with_object({}) do |entry, hash|
      path, _ip = entry.split(' ')
      hash[path] ||= 0
      hash[path] += 1
    end
  end
end