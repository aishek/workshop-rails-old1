class Article::Comment < ApplicationRecord
  belongs_to :article
  has_many :likes, dependent: :delete_all

  def likeable?
    likes_count_last_hour = likes.where('created_at >= ?', 1.hour.ago).count
    likes_count_last_hour < 5
  end
end
