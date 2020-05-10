require_relative 'scraper'

class ImgSet < SetsCreator
  attr_reader :name, :url, :total_elements
  attr_accessor :elements

  def initialize(set)
    doc = parsing(check_url(set))
    @total_images = check_set_size(doc)
    @set_url = check_url(set)
    @name = check_name(set)
    @elements = {}
    range_elements = (0...@total_images)
    range_elements.each do |i|
      @elements[i] = doc.xpath('//figure//img')[i].attribute('alt').value,
                     'https://www.loc.gov/free-to-use-/horses' + doc.xpath('//figure//img')[i].attribute('src').value
    end
  end
end
