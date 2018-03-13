require 'list_of_links'

describe '#self.all' do
  it 'user can see links' do
    links = Links.all
    expect(links).to include "http://www.makersacademy.com"
    expect(links).to include "http://www.google.com"
    expect(links).to include "http://www.facebook.com"
  end

describe '#self.create' do
  it 'creates a new link' do
    Links.create('https://www.bbc.co.uk')
    expect(Links.all).to include 'https://www.bbc.co.uk'
  end
end
end
