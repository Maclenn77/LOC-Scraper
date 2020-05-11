require_relative '../lib/sets_creator'
require 'open-uri'
require 'nokogiri'

class Nokogiri::HTML::Document
  include Scraper
end

describe SetsCreator do
  subject(:img_sets) { SetsCreator.new }

  describe '#check_urls' do
    it 'returns the url of a set' do
      expect(img_sets.check_url(1)).to eq('https://www.loc.gov/free-to-use/horses/')
    end
    it 'doesn\'t return the url of a set if set is 0' do
      expect(img_sets.check_url(0)).not_to eq('https://www.loc.gov/free-to-use/horses/')
    end
  end

  describe '#check_set_size' do
    it 'returns the number of images of a set' do
      doc = img_sets.parsing(img_sets.check_url(1))
      expect(img_sets.check_set_size(doc)).to be(55)
    end

    it 'doesn\'t return a value if set is 0' do
      doc = img_sets.parsing(img_sets.check_url(0))
      expect(img_sets.check_set_size(doc)).not_to be(55)
    end
  end
end
