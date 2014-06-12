require 'faker'

FactoryGirl.define do
  factory :raspisivac do |f|
    f.name { Faker::Name.first_name }
    f.avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'eu.jpg'), "image/jpeg") }
  end
end

