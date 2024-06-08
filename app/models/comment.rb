class Comment < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :post
  #commentに関する文字数制限バリデーション
  # validates :post_comment, length: { minimum: 1, maximum: 100 }
end
