require 'spec_helper'

feature 'user submits a question', %Q{
  As a launch academy student
  I want to submit a question
  So that my instructor will know what questions people have about the material and what topics need clarification
} do

  # ACCEPTANCE CRITERIA
  # * I will be able to enter a question or topic for clarification

  scenario 'logged-in user specifies a valid question' do
    login_with_oauth
    session = FactoryGirl.create(:session)
    visit session_questions_path(session)
    fill_in 'Body', with: "What is going on?"
    click_button 'Submit'
    expect(page).to have_content('Question created.')
    expect(page).to have_css('#questions', text: 'What is going on?')

    within '#questions' do
      expect(page).to have_content('What is going on?')
    end
  end

  let(:session) { FactoryGirl.create(:session) }

  scenario 'logged-in user does not specify valid information' do
    prev_count = Question.count
    login_with_oauth
    visit session_questions_path(session)
    click_button 'Submit'
    expect(page).to have_content("can't be blank")
    expect(Question.count).to eql(prev_count)
  end

  scenario 'non-logged-in user cannot enter question' do
    visit session_questions_path(session)
    expect(page).to_not have_content('Questions')
    expect(page).to_not have_selector("input[type=submit]")
  end
end
