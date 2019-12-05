require_relative './../../lib/bookmark'


feature 'updating bookmarks' do 

  before(:each) do 
    Bookmark.create("The Zoo", "http://www.bigbadzoo.com")
    visit ('/bookmarks')
    find('#Update-The-Zoo').click
  end 

  scenario "user wants to update existing bookmark" do
    expect(page).to have_content "Submit Change"
  end

  scenario "user submits changes for bookmark" do 
    fill_in "URL-The-Zoo", with: "http://www.smallbadzoo.com"
    click_on("Update")
    find('#Update-The-Zoo').click
    expect(page).to have_content "http://www.smallbadzoo.com"
  end
end