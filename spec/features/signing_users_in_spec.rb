require 'rails_helper'

RSpec.feature 'Users signing in' do

  before do
    @unconfirmed_user = User.create!(name: 'user1', email: 'user_unc@example.com', password: 'password')
    @confirmed_user = User.create!(name: 'user2', email: 'user_con@example.com', password: 'password', confirmed_at: DateTime.now)
  end

  scenario 'with valid credentials and confirmed user' do
    visit '/'
    click_link 'Sign in'

    fill_in 'Email', with: @confirmed_user.email
    fill_in 'Password', with: @confirmed_user.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page.current_path).to eq(root_path)
  end

  scenario 'with invalid credentials' do
    visit '/'
    click_link 'Sign in'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'with valid credentials and unconfirmed user' do
    visit '/'
    click_link 'Sign in'

    fill_in 'Email', with: @unconfirmed_user.email
    fill_in 'Password', with: @unconfirmed_user.password
    click_button 'Sign in'

    expect(page).to have_content('You have to confirm your email address before continuing.')
    expect(page.current_path).to eq(new_user_session_path)
  end

end