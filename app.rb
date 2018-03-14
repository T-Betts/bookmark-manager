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
    if params[:url] =~ /\A#{URI::regexp}\z/
      Link.create(params[:url])
    else
      flash[:notice] = "Error: Invalid URL. Please try again."
    end
    redirect('/')
  end

  run! if app_file == $0
end
