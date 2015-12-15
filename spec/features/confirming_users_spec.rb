require 'rails_helper'

RSpec.feature 'confirming users' do

  before do
    @unconfirmed_user = build :user, :unconfirmed_user
  end

  scenario do
    visit '/'
    click_link 'Sign up'

    fill_in 'user_name', with: @unconfirmed_user.name
    fill_in 'user_email', with: @unconfirmed_user.email
    fill_in 'user_password', with: @unconfirmed_user.password
    fill_in 'user_password_confirmation', with: @unconfirmed_user.password
    click_button 'Sign up'

    open_email(@unconfirmed_user.email)
    current_email.click_link('Confirm my account')

    expect(page).to have_content('Your email address has been successfully confirmed.')
  end
end