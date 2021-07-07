class Post < ApplicationRecord
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end