# frozen_string_literal: true

# Public: Given an array of log entries, calculate the different
#         ways we want to count page views.
#
#         This class is concerned about counting total page views and
#         also unique counts.
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

  # Public: Return a Hash of arrays with all paths and their counts.
  #
  #         We want to scope the counts by the type, either the total
  #         count or the unique count.
  #
  #         The returned Hash is keyed by the scope and each value is
  #         an array of arrays containing the path and the count.
  #
  # Returns Hash
  def all
    {
      total: total_counts.to_a,
      unique: unique_counts.map do |path, counts|
        [path, counts.keys.size]
      end
    }
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

  def unique_counts
    @unique_counts ||= entries.each_with_object({}) do |entry, hash|
      path, ip = entry.split(' ')
      hash[path] ||= {}
      hash[path][ip] ||= 0
      hash[path][ip] += 1
      hash
    end
  end
end
