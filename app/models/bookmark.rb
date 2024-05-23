class Bookmark < ApplicationRecord
  # <不要>
  belongs_to :user
  belongs_to :post
end
