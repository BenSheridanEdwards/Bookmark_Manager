require 'pg'

feature 'Viewing bookmarks' do

  feature 'Bookmark Manager Header' do 
    scenario "when a user visits the home page, the page title should be visable" do
      visit('/bookmarks/index')
      expect(page).to have_content "Bookmark Manager"
    end
  end

  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(4, 'http://www.askjeeves.com');")
    
    visit('/bookmarks/index')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.askjeeves.com"
  end
end
