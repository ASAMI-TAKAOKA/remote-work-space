class Comment < ApplicationRecord
  belongs_to :post  # postsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  validates :text, presence: true
end
