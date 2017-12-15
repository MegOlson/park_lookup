FactoryBot.define do
  factory :state do
    name Faker::Address.state
  end
  factory :park do
    name Faker::TwinPeaks.location
    state
  end
end
