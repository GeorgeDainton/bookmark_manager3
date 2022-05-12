
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/added' do
    Bookmark.add(params[:bookmark_url])
    redirect '/bookmarks'
  end 



  run! if app_file == $0
end
