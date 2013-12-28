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

  scenario 'Question state starts as asked' do
    new_question = question
    login_with_oauth
    visit '/'
    expect(new_question.state).to eql('asked')
  end

  scenario 'Question is upvoted 5 times' do
    new_question = question
    4.times do |n|
      Vote.create!(question_id: new_question.id, user_id: n)
    end
    login_with_oauth
    visit session_questions_path(question.session)
    click_on 'vote'
    expect(new_question.reload.state).to eql('sent')
  end

end

