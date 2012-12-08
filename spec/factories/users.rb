# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@tech.mak.ac.ug'
    password 'please'
    password_confirmation 'please'
    registration_number '09/U/2699/PS'
    association :academic_program, factory: :academic_program
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end