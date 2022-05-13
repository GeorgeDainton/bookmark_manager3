
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/added' do
    Bookmark.add(title: params[:bookmark_title], url: params[:bookmark_url])
    # these were  ^^missing key word argument tags,^^ i.e. title:, url
    redirect '/bookmarks'
  end 



  run! if app_file == $0
end
