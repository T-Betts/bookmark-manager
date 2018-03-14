require 'link'

describe Link do
  describe '#self.all' do
    it 'user can see links' do
      links = Link.all
      expect(links).to include "http://www.makersacademy.com"
      expect(links).to include "http://www.google.com"
      expect(links).to include "http://www.facebook.com"
    end
  end

  describe '#self.create' do
    it 'creates a new link' do
      Link.create('https://www.bbc.co.uk')
      expect(Link.all).to include 'https://www.bbc.co.uk'
    end
  end

end
