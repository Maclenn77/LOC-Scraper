require_relative '../lib/sets_creator'
require 'open-uri'
require 'nokogiri'

class Nokogiri::HTML::Document
  include Scraper
end

describe SetsCreator do
  subject(:html) { open('https://www.loc.gov/free-to-use/').read }
  subject(:doc) { Nokogiri::HTML.parse(html) }
  subject(:img_sets) { SetsCreator.new(doc) }

  describe '#check_urls' do
    it 'returns the url of a set' do
      expect(img_sets.check_url(1)).to eq('https://www.loc.gov/free-to-use/horses/')
    end
  end
end
