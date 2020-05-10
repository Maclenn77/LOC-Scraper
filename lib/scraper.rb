require 'open-uri'
require 'nokogiri'

module Scraper
  # Take loc url and create an analizable document
  FIND_SET_NAMES = /(?<=[[:punct:]]\s).*/.freeze

  def parse_loc
    html = open('https://www.loc.gov/free-to-use/').read
    parse_loc = Nokogiri::HTML.parse(html)
    parse_loc
  end

  # Take any url and create an analizable document
  def parsing(url)
    html = open(url).read
    parsed_data = Nokogiri::HTML.parse(html)
    parsed_data
  end

  # Returns the size of all image sets
  def imgsets_size
    parse_loc.xpath('//strong').length
  end

  def set_names
    arr_names = parse_loc.xpath('//strong').to_a
    arr_names = arr_names.map { |i| FIND_SET_NAMES.match(i).to_s }
    arr_names
  end

  def set_urls
    arr_urls = []
    urls_range = (0...imgsets_size)
    urls_range.each { |i| arr_urls << parse_loc.xpath('//figure//a')[i].attribute('href').value }
    arr_urls
  end
end
