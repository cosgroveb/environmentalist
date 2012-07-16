FactoryGirl.define do
  factory :environment do
    name { Faker::Lorem.words(1).first }
  end
end
