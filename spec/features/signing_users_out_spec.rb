require 'rails_helper'

RSpec.feature 'Users signing out' do

  before do
    @user = User.create!(name: 'user', email: 'user@example.com', password: 'password', confirmed_at: DateTime.now)
    login_as @user
  end

  scenario do
    visit '/'
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully')
    expect(page.current_path).to eq(root_path)
  end

end