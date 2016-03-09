FactoryGirl.define do
  factory :hostname do
    hostname Faker::Internet.domain_name
    description Faker::Hipster.sentence
  end
end
