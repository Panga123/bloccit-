include RandomData

FactoryGirl.define do
  factory :favorites do
    body RandomData.random_sentence
  
  end
end
