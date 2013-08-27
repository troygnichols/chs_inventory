require 'factory_girl'

FactoryGirl.define do
  factory :subject do
    name  { ['Biology', 'A&P', 'Chemistry', 'Alchemy', 'Wizardry', 'Witchcraft', 'Ballooning', 'Basketry'].sample }
  end
end


