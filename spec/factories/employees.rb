FactoryBot.define do
  factory :employee do
    name {"aman"}
    email {"aman03vyas@gmail.com"}
    address {"Nanda Nagar"}
    city {"Indore"}
    contact_num {9109623120}
    skills {"xzy"}
    experience {"xyz"}
    association :job_detail, factory: :job_detail
  end
end
