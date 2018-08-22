require 'rails_helper'

feature 'Sending form' do
  scenario 'send correct form' do
    visit root_path
    expect(User.count).to eq(0)
    fill_in 'name', with: 'some text'
    fill_in 'email', with: 'foo@example.com'
    fill_in 'street_name', with: 'some text'
    fill_in 'street_name_number', with: 'some text'
    fill_in 'city', with: 'some text'
    click_on 'Send'
    expect(User.count).to eq(1)
    expect(Address.count).to eq(1)
  end

  scenario 'send form without email' do
    visit root_path
    expect(User.count).to eq(0)
    fill_in 'name', with: 'some text'
    fill_in 'city', with: 'some text'
    click_on 'Send'
    expect(User.count).to eq(0)
    expect(Address.count).to eq(0)
  end

  scenario 'send form without city' do
    visit root_path
    expect(User.count).to eq(0)
    fill_in 'name', with: 'some text'
    fill_in 'email', with: 'foo@example.com'
    click_on 'Send'
    expect(User.count).to eq(0)
    expect(Address.count).to eq(0)
  end
end
