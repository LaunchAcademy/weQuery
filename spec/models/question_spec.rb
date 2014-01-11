require 'spec_helper'

describe Question do
  it { should belong_to :session }
  it { should belong_to :user }

  it { should have_valid(:body).when('What is going on?', 'Please explain TDD.', 'Why are people clapping in these videos?') }
  it { should_not have_valid(:body).when(nil, '') }
end
