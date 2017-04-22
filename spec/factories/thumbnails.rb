include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :thumbnail do
    image_url { fixture_file_upload("spec/fixtures/img/sample.png") }

    trait :main do
      status :main
    end

    trait :sub do
      status   :sub
    end
    factory :main_content, traits: [:main]
    factory :sub_content, traits: [:sub]
  end
end
