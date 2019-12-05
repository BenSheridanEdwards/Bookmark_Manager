require 'bookmark.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmark.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers Academy', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy All Software', 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Ask Jeeves', 'http://www.askjeeves.com');")

      bookmarks = Bookmark.all.map { |bookmark| bookmark.url }

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.askjeeves.com"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create('Test Bookmark', 'http://www.testbookmark.com')

      bookmarks = Bookmark.all.map { |bookmark| bookmark.url }

      expect(bookmarks).to include 'http://www.testbookmark.com'
    end
  end

end