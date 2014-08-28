require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Internet.user_name(4) }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) } 
       
    factory :admin do
      admin true
    end
    
  end
end