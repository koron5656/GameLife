class Post < ApplicationRecord
  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

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

end
