class Post < ApplicationRecord
  has_one_attached :image
  acts_as_taggable_on :tags

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #imageが存在しているかを確認するバリデーション
  validates :title, presence: true
  validates :posted_text, presence: true

  belongs_to :user

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  #def get_image
    #unless image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    #image
  #end

   # ransack用の検索対象フィールドを指定する
  def self.searchable_attributes
    %w[title posted_text]
  end
  searchable_attributes.each do |field|
    scope "search_by_#{field}", ->(keyword) { where("#{field} LIKE ?", "%#{keyword}%") }
  end

  def self.ransackable_attributes(auth_object = nil)
   ["title", "posted_text"] # 検索可能な属性名を指定
  end

  def self.ransackable_associations(auth_object = nil)
    [] # 検索可能な関連名を指定
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
