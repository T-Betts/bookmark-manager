# list of links
require 'pg'

class Links
  attr_reader :links, :url

  def initialize(url)
    @url = url
  end

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

end
