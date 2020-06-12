require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Friendship, type: :model do
  context 'Friendships associations tests' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end
end
