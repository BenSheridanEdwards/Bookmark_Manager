require 'bookmark.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmark.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.askjeeves.com"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
  
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
  end

end