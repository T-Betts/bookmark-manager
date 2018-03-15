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

  describe '#self.delete' do
    it "should delete a link" do
      link = Link.create(url: 'https://youtube.com', title: 'Youtube')
      Link.delete(link.id)
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include('https://youtube.com')
    end
  end

  describe '#self.update' do
    it "updates a link" do
      link = Link.create(url: 'https://youtube.com', title: 'Youtube')
      Link.update(link.id, url: 'http://www.notyoutube.com', title: 'Not Youtube')
      links = Link.all
      urls = links.map(&:url)
      titles = links.map(&:title)

      expect(urls).not_to include "https://youtube.com"
      expect(titles).not_to include "Youtube"
      expect(urls).to include "http://www.notyoutube.com"
      expect(titles).to include "Not Youtube"
    end
  end

  describe '.find' do
    it 'finds a link' do
      new_link = Link.create(url: 'https://youtube.com', title: 'Youtube')
      link = Link.find(new_link.id)

      expect(link.url).to eq "https://youtube.com"
      expect(link.title).to eq "Youtube"
    end
  end
end
