require_relative 'scraper'

class SetsCreator

  include Scraper

  def initialize
    @sets = get_set_names
  end
end
