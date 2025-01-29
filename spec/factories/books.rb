FactoryBot.define do
  factory :book do
    title { Faker::Name.name }
    author { Faker::FunnyName.name }
    published_year { '01.01.2000' }
  end
end
