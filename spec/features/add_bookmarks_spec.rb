require 'pg'

feature 'adding bookmarks' do 
  scenario 'user can add bookmarks' do 
    visit('/bookmarks')
    fill_in :bookmark_title, with: 'Wikipedia'
    fill_in :bookmark_url, with: 'http://www.wikipedia.org'
    click_button 'Add'
    expect(page).to have_link('Wikipedia', href:'http://www.wikipedia.org')
  end
end 

