feature "viewing bookmarks" do
  scenario "user views the bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    #Added test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit '/bookmarks'
    
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content("http://www.google.com")
  end
end
