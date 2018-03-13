require 'sinatra/base'
require './lib/list_of_links.rb'


class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Links.all
    erb(:index)
  end

  run! if app_file == $0
end
