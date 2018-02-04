module LikeCommentService
  def self.call(comment, max_likes_count_per_hour: 5)
    likes_count_last_hour = comment.likes.where('created_at >= ?', 1.hour.ago).count
    return if likes_count_last_hour >= max_likes_count_per_hour

    comment.transaction do
      Article.increment_counter :likes_count, comment.article_id
      comment.likes.create!
    end
  end
end
