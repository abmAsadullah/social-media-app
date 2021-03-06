require 'rails_helper'

RSpec.describe 'forgot password', type: :feature do
  before(:each) do
    User.create(email: 'user@example.com', name: 'user', password: 'password')
  end

  it 'raise error if email incorrect or does not exists' do
    visit '/users/password/new'
    within('#new_user') do
      fill_in 'Email', with: 'user@asd.com'
    end
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'Email not found'
  end

  it 'raise error if email blank' do
    visit '/users/password/new'
    within('#new_user') do
      fill_in 'Email', with: ''
    end
    click_button 'Send me reset password instructions'
    expect(page).to have_content "Email can't be blank"
  end
end
