FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'000000'}
    password_confirmation {password}
    family_name_kanji     {'山田'}
    first_name_kanji      {'陸太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birthday              {'2020-01-01'}

  end
end