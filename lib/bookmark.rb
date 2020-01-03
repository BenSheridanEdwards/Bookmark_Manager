require_relative 'database_connection'
require 'uri'

class Bookmark

  attr_accessor :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.all    
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map { |bookmark| new(bookmark['title'], bookmark['url']) }
  end

  def self.create(title, url)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end

  def self.delete(title)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE title = '#{title}'")
  end

  def self.update(target, new_title, new_url)
    target_to_edit = self.all.select { |bookmark| bookmark.title == target }.pop 
    target_to_edit.update_title(new_title)
    target_to_edit.update_url(new_url)
  end

  def update_title(new_title)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{new_title}' WHERE title = '#{@title}'")
  end 

  def update_url(new_url)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{new_url}' WHERE url = '#{@url}'")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  # def self.dbname
  #   ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  # end
end
