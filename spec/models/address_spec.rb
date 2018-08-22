require 'rails_helper'

# Test suite for the Item model
RSpec.describe Address, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:city) }

  it 'is not valid without a city' do
    user = FactoryBot.create(:user)
    address = FactoryBot.build(:address, user_id: user.id, city: nil)
    expect(address).to_not be_valid
  end
end
