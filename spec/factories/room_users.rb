FactoryBot.define do
  factory :room_user do
    association :user
    association :room
  end
end

#中間テーブルroom_userテーブルの値を定義する
#値はメッセージ送信機能で使用する