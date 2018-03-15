require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  #Clear the database
  connection.exec("TRUNCATE links;")

  #Add the test data
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.facebook.com', 'Facebook');")
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

    #Clear the database
    connection.exec("TRUNCATE links;")
end
