require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before(:each) do
    User.create(username: 'user1', full_name: 'user one')
    User.create(username: 'user2', full_name: 'user two')
    visit login_path
    within('form') do
      fill_in 'username', with: 'user1'
    end
    click_button 'Log In'
  end
  it 'follows a user' do
    visit sources_path
    expect { click_link 'Follow' }.to change(Following, :count).by(1)
  end

end