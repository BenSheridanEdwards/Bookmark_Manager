require 'pg'
class Bookmark

  attr_accessor :title, :url

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

  def self.update(target, new_title, new_url)
   target_to_edit = self.all.select { |bookmark| bookmark.title == target }.pop 
   target_to_edit.update_title(new_title)
   target_to_edit.update_url(new_url)

   
  end

  def self.dbname
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

  CONNECTION = PG.connect(dbname: dbname)

  def update_title(new_title)
    CONNECTION.exec("UPDATE bookmarks SET title = '#{new_title}' WHERE title = '#{@title}'")
  end 

  def update_url(new_url)
    CONNECTION.exec("UPDATE bookmarks SET url = '#{new_url}' WHERE url = '#{@url}'")
  end

end
