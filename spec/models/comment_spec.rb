require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment associations' do
    it { should belong_to(:user) }
    it { should belong_to(:source) }
  end

  describe 'comment validations' do
    it { should validate_presence_of(:text) }
  end
end
