FactoryGirl.define do 
  factory :product do
    sequence(:name) { |n| "product foo#{n}" }
    price 1.00
  end

end

