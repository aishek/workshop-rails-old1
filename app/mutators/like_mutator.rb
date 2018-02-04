module LikeMutator
  class << self
    def create!(comment, max_likes_count_per_hour: 5)
      likes_count_last_hour = comment.likes.where('created_at >= ?', 1.hour.ago).count
      return if likes_count_last_hour >= max_likes_count_per_hour

      comment.likes.create! article: comment.article
    end
  end
end
