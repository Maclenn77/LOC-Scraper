require_relative '../lib/scraper'

class Dummy
  include Scraper
end

describe Scraper do
  subject(:dummy) { Dummy.new }

  describe '#parsing' do
    it 'returns a Nokogiri::HTML::Document object' do
      html = 'http://example.com'
      expect(dummy.parsing(html)).to be_an_instance_of(Nokogiri::HTML::Document)
    end
  end
end
