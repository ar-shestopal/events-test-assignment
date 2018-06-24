FactoryBot.define do
  factory :event do
    title "Some Event"
    description "Some Important Event"
    sequence(:start) { |n| DateTime.now + n.hours }
    sequence(:end) { |n| DateTime.now + (n + 1).hours }
  end
end
