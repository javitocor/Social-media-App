require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Comment, type: :model do
  context 'Comment associations tests' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
