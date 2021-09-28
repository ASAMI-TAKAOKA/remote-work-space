class Post < ApplicationRecord
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  belongs_to :user
  validates :user_id, presence: true
  validates :text, presence: true, length: { maximum: 300 }
  validates :body, presence: true
  validates :address, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def self.search(search)
    if search != ""
      Post.where(['text LIKE ? OR body LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end
end