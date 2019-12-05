require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base


  get '/' do
    "Bookmark Manager"
    redirect 'bookmarks/index'
  end

  get '/bookmarks' do
    redirect 'bookmarks/index'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(params['title'], params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
