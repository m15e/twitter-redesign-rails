
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user associations' do
    it { should have_many(:followeds) }
    it { should have_many(:followers) }    
    it { should have_many(:sources).with_foreign_key(:author_id) }
    it { should have_many(:comments) }
  end
  describe 'user validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:full_name) }
  end
end