require 'rails_helper'

RSpec.feature 'AdminLogins', type: :feature do
  feature 'Administrator login' do

    before(:each) do
      visit new_admin_user_session_path
    end

    scenario 'with a valid email and password' do
      password = Faker::Internet.password(8)
      admin_user = FactoryGirl.create(:admin_user, password: password)

      fill_in 'E-post', with: admin_user.email
      fill_in 'Lösenord', with: password

      click_button 'Logga in'

      expect(page).to have_current_path(admin_dashboard_path)
    end

    scenario 'with invalid credentials' do
      fill_in 'E-post', with: Faker::Internet.email
      fill_in 'Lösenord', with: Faker::Internet.password(8)

      click_button 'Logga in'

      expect(page).to have_content('Ogiltig epost eller lösenord.')
    end
  end
end
