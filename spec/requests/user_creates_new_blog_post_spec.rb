require 'rails_helper'

feature 'User can create a new blog post' do
  scenario 'Unregistered user visits new blog post page' do
    visit root_path
    click_link 'Add Post'

    expect(page).to have_content('Create a post!')
  end

  scenario 'User creates a new post and it is persisted' do
    visit new_post_path
    fill_in 'Title', with: 'Blarghh post'
    fill_in 'Content', with: 'First post!'
    click_button 'Submit Post'

    within('#posts') do
      expect(page).to have_content('First post!')
    end
  end
end