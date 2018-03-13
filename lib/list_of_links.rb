# list of links
require 'pg'

class Links
  attr_reader :links

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM links")
    result.map { |link| link['url'] }
    # @links = ["http://www.makersacademy.com",
    #           "http://www.google.com",
    #           "http://www.facebook.com"]
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO links (url) VALUES('#{url}')")
  end

end
