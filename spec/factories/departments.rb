# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :department do
    name "Elec"
    association :college, factory: :college
  end
end
