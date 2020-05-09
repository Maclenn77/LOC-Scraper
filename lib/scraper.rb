require 'open-uri'
require 'nokogiri'

module Scraper
  # Take loc url and create an analizable document
  GET_SET_NAMES = /(?<=[[:punct:]]\s).*/

  def parse_loc
    html = open('https://www.loc.gov/free-to-use/').read
    parse_loc = Nokogiri::HTML.parse(html)
    parse_loc
  end

  # Take any url and create an analizable document
  def parsing
    html = open(@url).read
    parsed_data = Nokogiri::HTML.parse(html)
    parsed_data
  end

  # Returns the size of all image sets
  def imgsets_size
    parse_loc.length
  end

  def get_set_names
    set_names = parse_loc.xpath('//strong').to_a
    set_names = set_names.map { |i| GET_SET_NAMES.match(i).to_s }
    set_names
  end
end
