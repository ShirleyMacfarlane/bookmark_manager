feature "viewing bookmarks" do
    scenario "user views the bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      # Add the test data
      Bookmark.create(url: "http://www.makersacademy.com")
      Bookmark.create(url: "http://www.microsoft.com")
      Bookmark.create(url: "http://www.google.com")
  
      visit '/bookmarks'
      expect(page).to have_content("http://www.makersacademy.com")
      expect(page).to have_content("http://www.microsoft.com")
      expect(page).to have_content("http://www.google.com")
    end
  end
  