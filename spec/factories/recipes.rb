FactoryGirl.define do
  factory :recipe do
    title Faker::App.name
    url Faker::Internet.url('www.epicurious.com')
    hostname
  end
end
