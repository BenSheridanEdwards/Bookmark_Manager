require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/' do
    Bookmark.create(params['title'], params['url'])
    redirect '/'
  end

  post '/update_bookmark' do
    Bookmark.update(session[:target_to_edit], params["Title"], params["URL"])
    redirect '/'
  end

  post '/delete' do
    Bookmark.delete(params.keys.pop)
    redirect '/'
  end

  post '/update' do
    session[:target_to_edit] = params.keys.pop
    @title = session[:target_to_edit]
    @bookmark = Bookmark.all.select { |bookmark| bookmark.title == session[:target_to_edit] }.pop
    erb :"bookmarks/update"
  end

  run! if app_file == $0
end
