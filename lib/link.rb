require 'uri'
require_relative './database_connection_setup.rb'

class Link
  attr_reader :id, :url, :title
  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.link_valid?(url)
    url =~ /\A#{URI::regexp}\z/
  end

  def self.create(options)
    return false unless link_valid?(options[:url])
    res = DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
    Link.new(res[0]['id'], res[0]['url'], res[0]['title'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  def self.update(id, options)
    DatabaseConnection.query("UPDATE links SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}'")
  end
end
