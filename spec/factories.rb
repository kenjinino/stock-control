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

    ignore do
      lists_count 3
    end

    after(:create) do |order, evaluator|
      FactoryGirl.create_list(:order_line, evaluator.lists_count, order: order)
    end
  end

  factory :order_line do
    order
    product
    quantity 1
  end

end

