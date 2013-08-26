require 'factory_girl'

FactoryGirl.define do
  factory :item do
    name  { ['Erlenmeyer Flask', 'Volumetric Flask', 'Beaker', 'Graduated Cylinder', 'Bunsen Burner'].sample }
    size { [50, 100, 120].sample }
    units { ['mL', 'mm', nil].sample }
  end
end


