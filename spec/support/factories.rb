# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) {|n| "#{n}" }
    sequence(:name) {|n| "person#{n}" }
    oauth_token "token"
    oauth_secret "secret"
  end

  factory :admin_user do
    provider "github"
    sequence(:uid) {|n| "#{n}" }
    sequence(:name) {|n| "person#{n}" }
    oauth_token "token"
    oauth_secret "secret"
    admin true
  end

  factory :question do
    sequence(:body) {|n| "question body #{n}??" }
    association :user
    association :session
  end

  factory :session do
    sequence(:name) { |i| "session-#{i}"}
  end
end
