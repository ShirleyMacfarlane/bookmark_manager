require_relative '../lib/bookmark'
require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec('SELECT * FROM bookmarks;')
    p result
    #result.map { |bookmark| bookmark['url'] }
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end 
    #connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}, #{title}');")
      # I've broken it on to twp lines to make it a bit more readable
     result = connection.exec_params(
        # The first argument is our SQL query template
        # The second argument is the 'params' referred to in exec_params
        # $1 refers to the first item in the params array
        # $2 refers to the second item in the params array
        "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
     )

    # result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end 
    #connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}, #{title}');")
      # I've broken it on to twp lines to make it a bit more readable
     connection.exec_params(
        "DELETE FROM bookmarks WHERE id = $1;", [id]
     )

  end

  def self.update(id:, url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end 
    #connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}, #{title}');")
      # I've broken it on to twp lines to make it a bit more readable
     result = connection.exec_params(
        "UPDATE  bookmarks SET url= $1, title = $2 WHERE id = $3  RETURNING id, title, url;", [url, title, id]
     )
     #Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
     Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
     
  end
end

# {"id"=>"1", "url"=>"http://www.makersacademy.com"}
# {"id"=>"4", "url"=>"http://www.google.com"}
# {"id"=>"2", "url"=>"http://www.destroyallsoftware.com"}