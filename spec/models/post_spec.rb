require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Post, type: :model do
  context 'Post associations tests' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
