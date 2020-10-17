require 'rails_helper'

RSpec.describe Source, type: :model do
  describe 'source associations' do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
  end

  describe 'source validations' do
    it { should validate_presence_of(:text) }
  end
end
