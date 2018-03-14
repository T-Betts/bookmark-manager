require 'uri'
require_relative './database_connection_setup.rb'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.link_valid?(url)
    url =~ /\A#{URI::regexp}\z/
  end

  def self.create(url)
    return false unless link_valid?(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{url}')")
  end
end
