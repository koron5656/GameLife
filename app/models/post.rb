class Post < ApplicationRecord
  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  belongs_to :user

end
