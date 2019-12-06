require 'pg'

feature 'Viewing bookmarks' do

  feature 'Bookmark Manager Header' do 
    scenario 'when a user visits the home page, the page title should be visable' do
      visit('/')
      expect(page).to have_content 'Bookmark Manager'
    end
  end

  scenario 'A user can see bookmarks' do
    PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Google', 'http://www.google.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Ask Jeeves', 'http://www.askjeeves.com')

    visit('/')

    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Destroy All Software'
    expect(page).to have_content 'Ask Jeeves'
  end
end
