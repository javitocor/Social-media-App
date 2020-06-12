require 'rails_helper'
require 'capybara/rspec'

RSpec.describe UsersController, type: :feature do
  context 'GET users controller views' do
    let(:user) { User.create(id: '1', name: 'Peter', email: 'peter@example.com', password: 'password') }

    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end

    it 'Get #index' do
      visit users_path
      expect(page).to have_content('See Profile')
    end

    it 'Get #show' do
      visit user_path(user)
      expect(page).to have_content('Name:')
    end
  end

  context 'Testing send friend request' do
    let(:user) { User.create(id: '1', name: 'Peter', email: 'peter@example.com', password: 'password') }

    before :each do
      User.create(id: '2', name: 'Mick', email: 'mick@example.com', password: 'password')
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end

    scenario 'friend request link' do
      visit users_path
      expect(page).to have_content('Send friend request')
    end

    scenario 'send friend request' do
      visit users_path
      click_link 'Send friend request'
      expect(page).to have_content('Friend request pending')
    end
  end

  context 'Testing Accept and Decline friend requests' do
    let(:user) { User.create(id: '1', name: 'Peter', email: 'peter@example.com', password: 'password') }

    before :each do
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
    end

    scenario 'accept friend request' do
      click_link 'Accept'
      visit users_path
      expect(page).to have_content('Friends!!!')
    end

    scenario 'should create a new row with reversed attributes' do
      click_link 'Accept'
      expect(Friendship.where(user_id: '2', friend_id: '1', confirmed: true)).not_to be_empty
    end

    scenario 'decline friend request' do
      click_link 'Decline'
      visit users_path
      expect(page).to have_content('Send friend request')
    end
  end

  context 'Testing unfriend button' do
    let(:user) { User.create(id: '1', name: 'Peter', email: 'peter@example.com', password: 'password') }

    before :each do
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
      visit users_path
      click_link 'Accept'
      visit users_path
      click_link 'Unfriend'
    end

    scenario 'should unfriend' do
      expect(page).to have_content('Send friend request')
    end

    scenario 'should delete the new row with reversed attributes' do
      expect(Friendship.where(user_id: '1', friend_id: '2', confirmed: true)).to be_empty
      expect(Friendship.where(user_id: '2', friend_id: '1', confirmed: true)).to be_empty
    end
  end
end
