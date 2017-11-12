FactoryBot.define do
  factory :event do
    subject  { Faker::Job.title }
    owner { FactoryBot.create :user }
    topic { Topic.all.sample }
    place_name "Rinascimenti Sociali"
    place_address "Via Maria Vittoria, 38, 10123 Torino TO"
  end
end
