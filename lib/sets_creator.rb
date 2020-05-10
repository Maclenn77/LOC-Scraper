require_relative 'scraper'

class SetsCreator
  attr_reader :sets
  include Scraper

  def initialize(doc)
    @sets = doc.set_names
    @urls = doc.set_urls
  end

  def validate(choice, doc)
    if !choice.to_i.positive? or (choice.to_i > doc.imgsets_size)
      false
    else
      true
    end
  end
end
