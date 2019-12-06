feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/')
    click_button('NEW')
    fill_in('title', with: 'Test Bookmark')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'Test Bookmark'
  end
end
