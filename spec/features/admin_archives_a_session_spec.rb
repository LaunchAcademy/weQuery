require 'spec_helper'

feature 'admin archives a session', %Q{
  As an admin
  I want to archive a session
  So that it no longer appears in the list
} do
  # Acceptance Criteria

  # * Only admins can archive a session
  # * Archived sessions do not appear in the main listing of sessions

  let(:session) { FactoryGirl.create(:session) }
  scenario 'admin archives a session' do
    admin_login_with_oauth
    visit admin_session_path(session)

    click_button 'Archive'
    expect(page).to have_content('Session archived.')

    visit root_path
    expect(page).to_not have_content(session.name)
  end

  scenario 'user attempts to archive a session' do
    login_with_oauth
    visit admin_session_path(session)
    expect(page).to_not have_content('Archive')
    expect(page).to have_content('Access Denied')
  end

  scenario 'unauthenticated user attempts to archive a session' do
    visit admin_session_path(session)
    expect(page).to_not have_content('Archive')
    expect(page).to have_content('You must sign in')
  end
end
