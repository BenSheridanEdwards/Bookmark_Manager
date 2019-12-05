require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base


  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    'Bookmarks Manager'
    erb (:bookmarks)
    redirect 'bookmarks/index'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmarks.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  run! if app_file == $0
end
