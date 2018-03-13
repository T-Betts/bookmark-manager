require 'sinatra/base'
require './lib/list_of_links.rb'


class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Links.all
    erb(:index)
  end

  post '/new_link' do
    url = params[:url]
    connection = PG.connect(dbname: 'bookmark_manager')
    connection.exec("INSERT INTO links (url) VALUES('#{url}')")
    redirect('/')
  end

  run! if app_file == $0
end
