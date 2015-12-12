require 'rails_helper'

RSpec.feature 'Users signing out' do

  before do
    @confirmed_user = create :user, :confirmed_user
    login_as @confirmed_user
  end

  scenario do
    visit '/'
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully')
    expect(page.current_path).to eq(root_path)
  end

end