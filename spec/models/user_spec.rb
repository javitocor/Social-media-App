require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  context 'User associations tests' do
    it { should have_many(:friendships).with_foreign_key('user_id') }
    it { should have_many(:inverse_friendships).class_name('Friendship').with_foreign_key('friend_id') }
  end
end
