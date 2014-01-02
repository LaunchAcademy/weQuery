require 'spec_helper'

describe Session do
  it { should have_many(:questions).dependent(:destroy) }

  it { should have_valid(:name).when('a name', 'another name')}
  it { should_not have_valid(:name).when('', nil) }

  context 'uniqueness' do
    it 'validates uniqueness' do
      session = FactoryGirl.create(:session)
      dupe_session = FactoryGirl.build(:session, name: session.name)
      expect(dupe_session).to_not be_valid
    end
  end

  context 'archiving' do
    it 'archives a given instance' do
      session = FactoryGirl.create(:session)
      expect(session.archive).to be_true
      expect(Session.active).to_not include(session)
    end

    it 'archives only once' do
      session = FactoryGirl.create(:session)
      expect(session.archive).to be_true
      expect(session.archive).to be_false
    end
  end
end
