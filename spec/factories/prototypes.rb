FactoryGirl.define do
  factory :prototype do
    user
    title  { Faker::Name.name }
    catchcopy "hello!"
    concept "hoge.png"
    created_at  { Faker::Time.between(2.days.ago, Time.now) }
  end
end
