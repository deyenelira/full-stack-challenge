FactoryBot.define do 
  factory :book do
    name { Faker::Book.title }
    author { Faker::Book.author }
  end
end