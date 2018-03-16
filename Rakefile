require 'pg'

task :test_database_setup do
  p "Cleaning database..."
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE links;")
  connection.exec("ALTER SEQUENCE links_id_seq RESTART WITH 1")
  # connection.exec("ALTER SEQUENCE comments_id_seq RESTART WITH 1")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.facebook.com', 'Facebook');")
  # connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, link_id INTEGER REFERENCES links (id), text VARCHAR(240));")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    begin
      connection = PG.connect
      connection.exec("CREATE DATABASE #{ database };")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
    rescue
      puts "Error: #{database} already exists"
    end
  end
end

task :empty do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE links;")
end
