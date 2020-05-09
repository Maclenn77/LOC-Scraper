require 'pry'
require 'open-uri'
require 'nokogiri'

module Scraper
  # Take loc url and create an analizable document
  TAKE_SETS = /(?<=[[:punct:]]\s).*/.freeze

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
    parse_loc.xpath('//strong').length
  end

  # def get_set_names
  #   names = {}
  #   length = set_size
  #   for i in (1..length)
  #     names[]
  #
  # end
end
binding.pry
