# frozen_string_literal: true

# Public: Takes a PageCount object and converts it into the supported
#         output formats.
#
#         Currently we only support a `String` output.
#
#         This class gives us the flexibility to extend support to other
#         formats.
class Formatter
  # Public: Accepts a PageCount object as the only argument and stores
  #         it in memory ready to convert to an output format.
  #
  # page_count - PageCount behaves like an array of arrays.
  #              eg.
  #              [
  #                ['/home', 2],
  #                ['/about', 1]
  #              ]
  #
  # Returns an instance of Formatter
  def initialize(page_count)
    raise ArgumentError, 'page_count must be present' if page_count.nil?

    self.page_count = page_count
  end

  # Public: Converts the page count to a string.
  #
  #         Each line represents a path and the count of views.
  #
  # Returns String
  def to_s
    sorted_total_counts.map do |path, count|
      "#{path} #{count} visit#{'s' if count.zero? || count > 1}"
    end.join("\n")
  end

  private

  attr_accessor :page_count

  def sorted_total_counts
    page_count.sort do |a, b|
      b[1] <=> a[1]
    end
  end
end
