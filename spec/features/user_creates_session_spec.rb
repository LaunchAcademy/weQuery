require 'spec_helper'

feature 'user creates session' do
  # As an authenticated admin
  # I want to create a session
  # So that questions can be asked within it

  # Acceptance Criteria
  # * I must specify a unique name for the session
  # * The session starts with an active state
  # * After creation, I am redirected to a screen
  #   where I can ask questions

  scenario 'create a valid session' do
    admin_login_with_oauth
    visit new_admin_session_path

    fill_in 'Name', with: 'A Session'
    click_button 'Create Session'

    expect(page).to have_content('Session created.')
  end

  scenario 'attempt to create invalid session' do
    admin_login_with_oauth
    visit new_admin_session_path
    click_button 'Create Session'
    expect(page).to have_content("can't be blank")
  end

  scenario 'standard user attempts' do
    login_with_oauth
    visit new_admin_session_path
    expect(page).to have_content('Access Denied')
  end

  scenario 'not signed in' do
    visit new_admin_session_path
    expect(page).to have_content('You must sign in')
  end
end
