# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :academic_program do
    name "Elec"
    association :department, factory: :department
  end
end
