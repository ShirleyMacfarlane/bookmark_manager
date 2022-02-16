feature "adding bookmarks" do
  scenario "user adds a bookmarks" do
     visit 'bookmarks/new'
     fill_in('url', with: 'http://www.example.com')
     click_button "Add Link"
     expect(page).to have_content "http://www.example.com"
  end
end


