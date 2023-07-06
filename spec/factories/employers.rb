FactoryBot.define do
  factory :employer do
    name {"Cyber Infrastructure "}
    email { Faker::Internet.unique.email }
    address{"Eelectronic Complex"}
    city {"Indore"}
    state {"Madhya Pradesh"}
    country{"India"}
    contact{456789}
    association :user
  end
end
