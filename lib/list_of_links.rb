# list of links
require_relative './database_connection_setup.rb'

class Links
  attr_reader :links

  def self.all
    # moved if else connection into database_connection_setup.rb
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
    # @links = ["http://www.makersacademy.com",
    #           "http://www.google.com",
    #           "http://www.facebook.com"]
  end

  def self.create(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{url}')")
    # '#{options[:url]}'
  end

end
