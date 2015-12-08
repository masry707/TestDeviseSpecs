require 'rails_helper'

RSpec.feature 'Signing user up' do

  scenario 'with valid credentials' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('confirmation link has been sent to your email address. Please follow the link to activate your account.')
    expect(page.current_path).to eq(root_path)
  end

  scenario 'with invalid credentials' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
  end

end