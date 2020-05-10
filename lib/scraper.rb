require 'open-uri'
require 'nokogiri'

module Scraper
  # Take loc url and create an analizable document
  FIND_SET_NAMES = /(?<=[[:punct:]]\s).*/.freeze

  # Take url and create an analizable document

  def parsing(url)
    html = open(url).read
    parsed_data = Nokogiri::HTML.parse(html)
    parsed_data
  end

  # Returns the size of all image sets
  def imgsets_size(doc)
    doc.xpath('//strong').length
  end

  def names(doc)
    arr_names = doc.xpath('//strong').to_a
    arr_names = arr_names.map { |i| FIND_SET_NAMES.match(i).to_s }
    arr_names
  end

  def urls_array(doc)
    arr_urls = []
    urls_range = (0...imgsets_size(doc))
    urls_range.each { |i| arr_urls << doc.xpath('//figure//a')[i].attribute('href').value }
    arr_urls
  end
end
