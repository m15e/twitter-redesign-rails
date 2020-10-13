require 'rails_helper'

RSpec.feature 'Sources', type: :feature do
  context 'Source create and destroy' do
    before(:each) do
      User.create(username: 'user1', full_name: 'user one')
      visit login_path
      within('form') do
        fill_in 'username', with: 'user1'
      end
      click_button 'Log In'
    end

    it 'creates a source' do
      visit sources_path
      within('form') do
        fill_in 'source[text]', with: 'source or sauce?'
      end
      expect { click_button 'Submit' }.to change(Source, :count).by(1)
    end

    it 'destroys a source' do
      visit sources_path
      within('form') do
        fill_in 'source[text]', with: 'source or sauce?'
      end
      click_button 'Submit'

      expect { click_link 'Destroy' }.to change(Source, :count).by(-1)
    end
  end
end

RSpec.feature 'Sources', type: :feature do
  context 'Source edit' do
    it 'edits a source' do
      visit sources_path
      within('form') do
        fill_in 'source[text]', with: 'source or sauce?'
      end
      click_button 'Submit'
      click_link 'Edit'
      within('form') do
        fill_in 'source[text]', with: 'J-Live - Braggin Writes (1996)'
      end
      click_button 'Submit'
      expect(page).to have_content('Source was successfully updated.')
    end
  end
end
