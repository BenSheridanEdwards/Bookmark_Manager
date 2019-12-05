require 'pg'
class Bookmark

  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.all    
    result = CONNECTION.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| new(bookmark['title'], bookmark['url']) }
  end

  def self.create(title, url)
    CONNECTION.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end

  def self.delete(title)
    CONNECTION.exec("DELETE FROM bookmarks WHERE title = '#{title}'")
  end

  def self.dbname
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

  CONNECTION = PG.connect(dbname: dbname)
end
