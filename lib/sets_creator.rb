require_relative 'scraper'

class SetsCreator
  attr_reader :sets, :doc
  include Scraper

  def initialize
    @doc = parsing('https://www.loc.gov/free-to-use/')
    @sets = names(@doc)
    @urls = urls(@doc)
  end

  def validate(choice, object)
    if !choice.to_i.positive? or (choice.to_i > imgsets_size(object.doc))
      false
    else
      true
    end
  end

  def check_url(set)
    url_index = set - 1
    @urls[url_index]
  end

  def check_name(set)
    name_index = set - 1
    @sets[name_index]
  end

  def check_set_size(doc)
    doc.doc.xpath('//figure//img').length
  end
end
