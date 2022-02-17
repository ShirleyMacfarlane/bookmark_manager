feature "adding bookmarks" do
  scenario "user adds a bookmarks" do
     visit 'bookmarks/new'
     fill_in('url', with: 'http://www.example.com')
     fill_in('title', with: 'Test Bookmark')
     click_button "Add Link"
     expect(page).to have_link('Test Bookmark', href: 'http://www.example.com')
  end
end


