require_relative '../lib/bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #Added test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

      # expect(bookmarks).to include('http://www.makersacademy.com')
      # expect(bookmarks).to include('http://www.destroyallsoftware.com')
      # expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      # bookmark = Bookmark.create("http://www.test.com")
      # expect(bookmark['url']).to eq 'http://www.example.org'
      #expect(Bookmark.all).to include 'http://www.testbookmark.com'
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)


      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end


  describe '.delete' do
    it 'deletes a bookmark' do

      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      expect(Bookmark.all.length).to eq 1
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end


  describe '.update' do
    it 'update a bookmark' do

      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.testbookmarkUpdate.com', title: 'Test Update Bookmark')
      expect(updated_bookmark.title).to eq 'Test Update Bookmark'
    end
  end
end