require 'spec_helper'

describe Question do
  it { should belong_to :session }
  it { should belong_to :user }

  it { should have_valid(:body).when('What is going on?', 'Please explain TDD.', 'Why are people clapping in these videos?') }
  it { should_not have_valid(:body).when(nil, '') }

  describe '#check_state' do
    it 'has a state of asked' do
      question = FactoryGirl.create(:question)
      expect(question.state).to eql('asked')
    end

    it 'transitions to expired' do
      question = FactoryGirl.create(:question)
      old_time = Time.now
      Timecop.freeze(Time.now + 2.hours) do
        Question.check_expiration
        expect(question.reload.state).to eql('expired')
      end
    end
  end
end
