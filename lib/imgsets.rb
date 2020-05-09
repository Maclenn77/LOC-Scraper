require_relative 'scraper'

class ImgSets
  include Scraper
  attr_reader :name, :url, :total_elements
  attr_accessor :elements

  def initialize(name, url)
    @name = name
    @url = url
    @elements = []
    @total_elements = @elements.length
    @@all_sets[@name] = @url
  end
end
