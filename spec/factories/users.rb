FactoryGirl.define do

  factory :user do
    nickname              "abe"
    email { Faker::Internet.email }
    #fakerを使ってダミーデータを作成する書き方
    password              "00000000"
    password_confirmation "00000000"
    member                "techcamp"
    work                  "student"
    avatar                "cat"
    profile               "student"
  end

end
