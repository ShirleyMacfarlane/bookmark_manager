require_relative '../lib/bookmark'
require 'pg'

class Bookmark
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec('SELECT * FROM bookmarks;')
    p result
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    p url
    result = connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    p result
  
  end
end

# {"id"=>"1", "url"=>"http://www.makersacademy.com"}
# {"id"=>"4", "url"=>"http://www.google.com"}
# {"id"=>"2", "url"=>"http://www.destroyallsoftware.com"}