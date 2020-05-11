require_relative '../lib/imgsets'
require 'open-uri'
require 'nokogiri'

describe ImgSet do
  subject(:sets) { SetsCreator.new }
  subject(:img) { ImgSet.new(1, sets) }

  describe '#display_description' do
    it 'returns a string' do
      expect(img.display_description(1)).to be_an_instance_of(String)
    end

    it 'returns No image chosen if index is 0' do
      expect(img.display_description(0)).to include('No image chosen')
    end

    it 'returns description if index given' do
      expect(img.display_description(1)).to include('Scene from the Cannon Quarter Horse')
    end
  end

  describe '#display_url' do
    it 'returns a string' do
      expect(img.display_url(1)).to be_an_instance_of(String)
    end

    it 'returns No image chosen if index is 0' do
      expect(img.display_url(0)).to include('No image chosen')
    end

    it 'returns an URL if index given' do
      expect(img.display_url(1)).to include('http')
    end
  end

  describe '#display_url_nd_description' do
    it 'returns a string' do
      expect(img.display_url_nd_description(1)).to be_an_instance_of(String)
    end

    it 'returns No image chosen if index is 0' do
      expect(img.display_url_nd_description(0)).to include('No image chosen')
    end

    it 'returns description if index given' do
      expect(img.display_url_nd_description(1)).to include('Scene from')
    end

    it 'returns url if index given' do
      expect(img.display_url_nd_description(1)).to include('http')
    end
  end

  describe '#all_items' do
    it 'returns a string' do
      expect(img.all_items).to be_an_instance_of(String)
    end

    it 'doesn\'t return No image chosen' do
      expect(img.all_items).not_to include('No image chosen')
    end

    it 'returns description' do
      expect(img.all_items).to include('Scene from')
    end

    it 'returns url if index given' do
      expect(img.all_items).to include('http')
    end
  end
end
