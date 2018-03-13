require 'list_of_links'

describe '#self.all' do
  it 'user can see links' do
    links = Links.all
    expect(links).to include "http://www.makersacademy.com"
    expect(links).to include "http://www.google.com"
    expect(links).to include "http://www.facebook.com"
  end
end
