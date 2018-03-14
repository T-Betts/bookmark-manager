require 'sinatra/base'
require './lib/link.rb'
require_relative './lib/database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash


  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/new_link' do
    flash[:notice] = "Error: Invalid URL. Please try again." unless Link.create(params[:url])
    redirect('/')
  end

  run! if app_file == $0
end
