require_relative 'scraper'

class SetsCreator
  attr_reader :sets
  include Scraper

  def initialize
    @sets = set_names
    @urls = set_urls
  end

  def validate(choice)
    if !choice.to_i.positive? or (choice.to_i > imgsets_size)
      false
    else
      true
    end
  end
end
