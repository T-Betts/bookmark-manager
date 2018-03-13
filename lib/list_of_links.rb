# list of links
require 'pg'

class Links
  attr_reader :links

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM links")
    result.map { |link| link['url'] }
    # @links = ["http://www.makersacademy.com",
    #           "http://www.google.com",
    #           "http://www.facebook.com"]
  end
end
