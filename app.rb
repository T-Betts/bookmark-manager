require 'sinatra/base'
require './lib/link.rb'
require_relative './lib/database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'
# require './lib/comment.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/links')
  end

  get '/links' do
    @links = Link.all
    erb(:"links/index")
  end

  post '/links/new_link' do
    link = Link.create(url: params['url'], title: params['title'])
    flash[:notice] = "Error: Invalid URL. Please try again." unless link
    redirect('/links')
  end

  post "/links/delete_link" do
    Link.delete(params['id'])
    redirect('/links')
  end

  get '/links/update_link_form' do
    @link = Link.find(params['id'])
    erb :"links/update_link"
  end

  post '/links/update-link' do
    Link.update(params['id'], params)
    redirect('/links')
  end


  run! if app_file == $0
end
