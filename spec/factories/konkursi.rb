require 'faker'

FactoryGirl.define do
  factory :konkurs do |f|
    f.ime { Faker::Name.name }
    f.opis { Faker::Lorem.paragraph }    
    f.iznos { Faker::Number.number(10) }
    f.dokument { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'original.zip'), "application/zip") }
  end
end