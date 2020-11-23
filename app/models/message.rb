class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :room
  belongs_to :user

  #Active Storageデーブルに画像を保存する実装を行う
  #ここで用いるのがhas_one_attachedメソッド
  #レコードとファイルを1対1の関係で紐付ける
  #has_one_attachedメソッドを記述したモデルの各レコードは、それぞれ１つのファイルを添付できる
  #ファイル名は、そのモデルが紐づいたフォームから送られるパラメーターのキーにもなる

  has_one_attached :image
end
