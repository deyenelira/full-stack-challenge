FactoryBot.define do 
  factory :lend do
    association :user
    association :book
    return_date { DateTime.now + 1.month }
  end
end