FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000scb'}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"勇気"}
    katakana_full_name    {"ヤマダ"}
    katakana_name         {"ユウキ"}
    birth_date            {"2000-10-18"}
  end
end
