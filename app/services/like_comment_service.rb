class LikeCommentService
  include Dry::Transaction
  include Dry::Monads::List::Mixin

  step :validate
  map  :persist

  MAX_LIKES_PER_HOUR = 5

  def validate(comment: nil)
    if comment.likes.where('created_at >= ?', 1.hour.ago).count < MAX_LIKES_PER_HOUR
      Right(comment: comment)
    else
      Left(comment: comment)
    end
  end

  def persist(comment: nil)
    comment.transaction do
      Article.increment_counter :likes_count, comment.article_id
      comment.likes.create!
    end
  end
end
