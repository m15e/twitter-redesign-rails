require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before(:each) do
    User.create(username: 'user1', full_name: 'user one')
    User.create(username: 'user2', full_name: 'user two')

    visit login_path
    within('form') do
      fill_in 'username', with: 'user1'
    end
    click_button 'Log In'

    visit sources_path
    within('form') do
      fill_in 'source[text]', with: 'source or sauce?'
    end
    click_button 'Submit'
  end

  it 'comments on a post' do
    within('form#new_comment') do
      fill_in 'comment[text]', with: 'this is a comment'
    end
    expect { click_button 'Comment' }.to change(Comment, :count).by(1)
  end

  it 'deletes a comment on a post after creating it' do
    within('form#new_comment') do
      fill_in 'comment[text]', with: 'this is a comment'
    end
    click_button 'Comment'
    expect { first('.destroy-comment').click }.to change(Comment, :count).by(-1)
  end
end
