require 'sinatra/base'
require './lib/list_of_links.rb'
require './lib/database_connection_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Links.all
    erb(:index)
  end

  post '/new_link' do
    Links.create(params[:url])
    redirect('/')
  end

  run! if app_file == $0
end
