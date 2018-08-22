require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  it { should have_one(:address).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:email) }
  # test format
  it { should allow_value('email@addresse.foo').for(:email) }
  it { should_not allow_value('emailaddresse.foo').for(:email) }
  it { should_not allow_value('@emailaddresse.foo').for(:email) }
  # test uniqueness
  it { should_not allow_value(user.email).for(:email) }

  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
