require 'rails_helper'
require 'capybara/rspec'
# rubocop:disable  Metrics/BlockLength
RSpec.describe PostsController, type: :feature do
  context 'timeline displays friends posts' do
    let(:user) { User.create(id: '1', name: 'Peter', email: 'peter@example.com', password: 'password') }
    scenario 'display current user posts' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      fill_in 'post_content', with: 'Testing posts with rspec in rails'
      click_button 'Save'
      visit root_path
      expect(page).to have_content('with rspec in rails')
    end
    scenario 'display friends posts' do
      user2 = User.create(id: '2', name: 'Mick', email: 'mick@example.com', password: 'password')
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit users_path
      click_link 'Send friend request'
      click_link 'Sign out'
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit user_path(user2)
      click_link 'Accept'
      visit root_path
      fill_in 'post_content', with: 'Testing posts with rspec in rails and I am a friend'
      click_button 'Save'
      sleep(2)
      click_link 'Sign out'
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('and I am a friend')
    end
    scenario 'cannot see posts if are not friends' do
      user2 = User.create(id: '2', name: 'Mick', email: 'mick@example.com', password: 'password')
      visit new_user_session_path
      fill_in 'user_email', with: user2.email
      fill_in 'user_password', with: user2.password
      click_button 'Log in'
      visit root_path
      fill_in 'post_content', with: 'Testing posts with rspec in rails and I am a friend'
      click_button 'Save'
      sleep(2)
      click_link 'Sign out'
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      expect(page).not_to have_content('and I am a friend')
    end
  end
  # rubocop:enable  Metrics/BlockLength
end
