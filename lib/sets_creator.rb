require_relative 'scraper'

class SetsCreator
  attr_reader :sets
  include Scraper

  def initialize
    @sets = set_names
    @urls = set_urls
  end
end
