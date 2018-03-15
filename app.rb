require 'sinatra/base'
require './lib/link.rb'
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
    link = Link.create(url: params['url'], title: params['title'])
    flash[:notice] = "Error: Invalid URL. Please try again." unless link
    redirect('/')
  end

  run! if app_file == $0
end
