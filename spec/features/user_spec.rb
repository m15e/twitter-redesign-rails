require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'Login functionality' do
    it 'logs a user in' do
      User.create(username: 'user1', full_name: 'user one')
      visit login_path
      within('form') do
        fill_in 'username', with: 'user1'
      end
      click_button 'Log In'
      expect(page).to have_content('Sources')
    end

    it 'logs a user out' do
      User.create(username: 'user1', full_name: 'user one')
      visit login_path
      within('form') do
        fill_in 'username', with: 'user1'
      end
      click_button 'Log In'
      click_link 'Logout'
      expect(page).to have_content('Logged out')
    end

    it 'tells user when account does not exist' do
      visit login_path
      within('form') do
        fill_in 'username', with: 'user1'
      end
      click_button 'Log In'
      expect(page).to have_content('user does not exist')
    end
  end
end

RSpec.feature 'Users', type: :feature do
  context 'User creation' do
    it 'creates a new user' do
      visit login_path
      visit new_user_path
      within('form') do
        fill_in 'user[username]', with: 'newuser'
        fill_in 'user[full_name]', with: 'Full Name'
      end
      expect { click_button 'New User' }.to change(User, :count).by(1)
    end
  end
end
