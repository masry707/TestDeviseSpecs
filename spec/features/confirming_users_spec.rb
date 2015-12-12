require 'rails_helper'

RSpec.feature 'confirming users' do

  before do
    @unconfirmed_user = create :user, :unconfirmed_user
  end

  scenario do
    visit "/users/confirmation?confirmation_token=#{@unconfirmed_user.confirmation_token}"

    expect(page).to have_content('Your email address has been successfully confirmed.')
    expect(page.current_path).to eq(new_user_session_path)
  end
end