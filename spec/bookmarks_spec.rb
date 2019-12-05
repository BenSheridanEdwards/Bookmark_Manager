require 'bookmarks.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmarks.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.askjeeves.com"
    end
  end

end