require_relative 'sets_creator'
require_relative 'scraper'

class ImgSet < SetsCreator
  attr_reader :name, :url, :total_images
  attr_writer :elements
  BAR_STAR = '*'.center(80, '*')
  BAR_LINE = '-'.center(80, '-')

  def initialize(set, object)
    doc = parsing(object.check_url(set))
    @total_images = check_set_size(doc)
    @url = object.check_url(set)
    @name = object.check_name(set)
    @elements = { 0 => ['No image chosen', 'No image chosen'] }
    range_elements = (0...@total_images)
    range_elements.each do |i|
      k = i + 1
      @elements[k] = doc.xpath('//figure//img')[i].attribute('alt').value,
                     'https://www.loc.gov/free-to-use-/horses' + doc.xpath('//figure//img')[i].attribute('src').value
    end
  end

  def display_url_nd_description(index)
    description_plus_url = "#{display_description(index)}#{display_url(index)}"
    description_plus_url
  end

  def all_items
    display_items = "ALL ITEMS \n"
    img_range = (1...total_images)
    img_range.each { |i| display_items << ("Image #{i}. \n" + display_url_nd_description(i)) }
    display_items
  end

  private

  def display_description(index)
    description = "#{BAR_STAR}\nDESCRIPTION: #{@elements[index][0]}\n"
    description
  end

  def display_url(index)
    url = "#{BAR_LINE}\nURL: #{@elements[index][1]}\n#{BAR_STAR}\n"
    url
  end
end
