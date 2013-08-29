FactoryGirl.define do 
  factory :product do
    sequence(:name) { |n| "product foo#{n}" }
    price 1.00
  end

  factory :client do
    sequence(:name) { |n| "client name foo#{n}" }
    sequence(:address) { |n| "client address foo#{n}" }
  end

  factory :order do
    client
  end

end

