require 'rails_helper'

RSpec.feature 'Signing user up' do

  before do
    # create a user form users factory
    @user = build :user
  end

  scenario 'with valid credentials' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password
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

  scenario 'with invalid password confirmation' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: 'mismatch_password'
    click_button 'Sign up'

    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  scenario 'with password less than 8 characters' do
    min_password = 8
    short_password = 'p' * (min_password - 1)

    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: short_password
    fill_in 'Password confirmation', with: short_password
    click_button 'Sign up'

    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

end