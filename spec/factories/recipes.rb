FactoryGirl.define do
  factory :recipe do
    title Faker::App.name
    url Faker::Internet.url
    hostname
  end

  factory :invalidRecipe, parent: :recipe do
    title nil
    url nil
  end
end
