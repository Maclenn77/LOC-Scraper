require_relative '../lib/scraper'

class Dummy
  include Scraper
end

describe Scraper do
  subject(:dummy) { Dummy.new }
  subject(:sets) { SetsCreator.new }

  describe '#parsing' do
    it 'returns a Nokogiri::HTML::Document object' do
      html = 'http://example.com'
      expect(dummy.parsing(html)).to be_an_instance_of(Nokogiri::HTML::Document)
    end
  end

  describe '#imgsets_size' do
    it 'returns the number of sets' do
      expect(sets.imgsets_size(sets.doc)).to be(40)
    end
  end

  describe '#names' do
    it 'returns an array' do
      expect(sets.names(sets.doc)).to be_an_instance_of(Array)
    end

    it 'returns an array with names of the sets, like \'Horses\'' do
      expect(sets.names(sets.doc)).to include('Horses')
    end
  end

  describe '#urls_array' do
    it 'returns an array' do
      expect(sets.urls_array(sets.doc)).to be_an_instance_of(Array)
    end

    it 'returns an array with urls, like https://www.loc.gov/free-to-use/horses/' do
      expect(sets.urls_array(sets.doc)).to include('https://www.loc.gov/free-to-use/horses/')
    end
  end
end
