require_relative 'scraper'

class ImgSet < SetsCreator
  attr_accessor :name, :url, :total_images, :elements

  def initialize(set, object)
    doc = parsing(object.check_url(set))
    @total_images = check_set_size(doc)
    @url = object.check_url(set)
    @name = object.check_name(set)
    @elements = {}
    range_elements = (0...@total_images)
    range_elements.each do |i|
      @elements[i] = doc.xpath('//figure//img')[i].attribute('alt').value,
                     'https://www.loc.gov/free-to-use-/horses' + doc.xpath('//figure//img')[i].attribute('src').value
    end
  end
end
