require 'bookmark.rb'

describe Bookmark do

  let(:bookmarks) { Bookmark.new }

  before(:each) do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Google', 'http://www.google.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Ask Jeeves', 'http://www.askjeeves.com')
  end

  describe '#all' do 
    it "displays all the users bookmarks" do
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

  describe '.delete' do
    it 'deletes a selected bookmark' do
      Bookmark.delete('Ask Jeeves')

      bookmarks = Bookmark.all.map { |bookmark| bookmark.title }

      expect(bookmarks).not_to include 'Ask Jeeves'
    end
  end
end
