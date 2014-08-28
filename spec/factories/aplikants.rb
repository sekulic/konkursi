require 'faker'

FactoryGirl.define do
  factory :aplikant do |f|
    f.name { Faker::Name.name }
  end
end