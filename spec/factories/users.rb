FactoryGirl.define do
  pw = RandomData.random_sentence
  #3
  #name of the factory is user
  factory :user do
    name RandomData.random_name
    #4 creates unique email address for each user the factory builds
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
end
