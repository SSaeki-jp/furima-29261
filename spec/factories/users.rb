FactoryBot.define do
  factory :user do
    nickname                     {Faker::Name.initials(number: 2)}
    email                        {Faker::Internet.free_email}
    password                     {Faker::Internet.password(min_length: 6)}
    lastname_fullwidth_kanji     {Gimei::last.kanji}
    firstname_fullwidth_kanji    {Gimei::first.kanji}
    lastname_fullwidth_katakana  {Gimei::last.katakana}
    firstname_fullwidth_katakana {Gimei::first.katakana}
    birthday                     {Faker::Date.between(from: '2000-01-01', to: '2015-01-01')}
    password_confirmation        {password}
  end
end
