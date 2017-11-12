FactoryBot.define do
  factory :event do
    subject  { Faker::Job.title }
    owner { FactoryBot.create :user }
    topic { Topic.all.sample }
    place_name { ["Rinascimenti Sociali", Faker::LordOfTheRings.location].sample }
    place_address "Via Maria Vittoria, 38, 10123 Torino TO"
    starting_at { Time.now + 2.days }
    max_participants { [3, 6, 12].sample }
  end
end
