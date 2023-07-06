FactoryBot.define do
  factory :user do
    email {Faker::Internet.email }
    password {"123456"} 
    role {"employer"}

    trait :employee do
      role { "employee" }
    end
    
    trait :employer do
      role { "employer" }
    end

  end
end


