require_relative './../../lib/bookmark'

feature 'updating bookmarks' do 

  before(:each) do 
    Bookmark.create("The Zoo", "http://www.bigbadzoo.com")
    visit('/')
    find('#Update-The-Zoo').click
  end 

  scenario "user wants to update existing bookmark" do
    expect(page).to have_button "UPDATE"
  end

  scenario "user submits changes for bookmark" do 
    fill_in "URL", with: "http://www.smallbadzoo.com"
    click_on("Update")
    click_link("The Zoo")
    expect(page).to have_current_path "http://www.smallbadzoo.com"
  end
end
