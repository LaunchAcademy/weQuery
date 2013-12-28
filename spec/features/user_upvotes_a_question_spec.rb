require 'spec_helper'

feature 'user upvotes a question', %Q{
  As a launch academy student
  I want to upvote questions
  So that my instructor will know how many people want that question answered
} do

  # ACCEPTANCE CRITERIA
  # * I will be able to upvote a question that I would like answered
  # * I will only be able to upvote a question once

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }

  scenario 'logged-in user upvotes a question' do
    new_question = question
    prev_count = new_question.votes.count
    login_with_oauth
    visit session_questions_path(new_question.session)

    click_on 'vote'
    expect(new_question.votes.count).to eql(prev_count + 1)
  end

  scenario 'logged-in user upvotes a question twice' do
    new_question = question
    prev_count = new_question.votes.count
    login_with_oauth
    visit session_questions_path(new_question.session)

    click_on 'vote'
    click_on 'vote'
    expect(new_question.votes.count).to eql(prev_count + 1)
  end




end
