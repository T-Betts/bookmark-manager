require 'link'

describe Link do
  describe '#self.all' do
    it 'user can see links' do
      links = Link.all

      urls = links.map(&:url)
      expect(urls).to include "http://www.makersacademy.com"
      expect(urls).to include "http://www.google.com"
      expect(urls).to include "http://www.facebook.com"
    end
  end

  describe '#self.create' do
    it 'creates a new link' do
      Link.create(url: 'https://www.bbc.co.uk')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include 'https://www.bbc.co.uk'
    end

    it 'does not add invalid links' do
      Link.create(url: 'hello')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include "hello"
    end
  end
end
