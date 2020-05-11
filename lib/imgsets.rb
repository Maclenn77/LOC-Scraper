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

  def display_description(index)
    description = "DESCRIPTION: #{@elements[index][0]}"
    description
  end

  def display_url(index)
    url = "URL: #{@elements[index][1]}"
    url
  end

  def display_url_nd_description(index)
    description_plus_url = "#{display_description(index)} \n #{display_url(index)} \n"
    description_plus_url
  end

  def all_items
    display_items = "ALL ITEMS \n"
    img_range = (1...total_images)
    img_range.each { |i| display_items << ("Image #{i}. \n" + display_url_nd_description(i)) }
    display_items
  end
end
