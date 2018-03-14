require 'sinatra/base'
require './lib/link.rb'
require_relative './lib/database_connection_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/new_link' do
    Link.create(params[:url])
    redirect('/')
  end

  run! if app_file == $0
end
