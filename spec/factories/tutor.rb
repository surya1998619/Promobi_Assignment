FactoryBot.define do
  factory :tutor do
    name { "John" }
    course { association :course } # This will create a valid associated course
    age { 23 }
    gender { "Male" }
    experience { "3 years" }
  end
end
