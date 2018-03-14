# list of links
require_relative './database_connection_setup.rb'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.create(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{url}')")
  end
end
