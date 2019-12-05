require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
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

  post '/update_bookmark' do
    Bookmark.update(session[:target_to_edit], params["Title"], params["URL"])
  
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.delete(params.keys.pop)
    redirect '/bookmarks'
  end

  post '/update' do
    session[:target_to_edit] = params.keys.pop
    @title = session[:target_to_edit]




  #  Bookmark.update(params.keys.pop, params["New Title"], params["New URL"])
  #  redirect '/bookmarks'
  erb :"bookmarks/update"
  end

  run! if app_file == $0
end
