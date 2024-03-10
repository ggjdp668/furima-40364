FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.unique.name}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             { %w(佐藤 鈴木 高橋).sample }
    first_name            { %w(太郎 次郎 花子).sample }
    last_name_kana        { %w(サトウ スズキ タカハシ).sample }
    first_name_kana       { %w(タロウ ジロウ ハナコ).sample }
    date_of_birth         {Faker::Date.birthday}
  end
end