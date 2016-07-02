require 'rails_helper'

RSpec.feature 'User views confessions', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'with an invalid session' do
    visit confessions_path

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'with a valid session' do
    login_as(user, scope: :user)

    visit confessions_path

    expect(page).to have_content('Bekännelser')
  end

  scenario 'sees their confessions' do
    login_as(user, scope: :user)

    confession = FactoryGirl.create(:confession, user: user)

    visit confessions_path

    expect(page).to have_content(confession.body)
  end
end
