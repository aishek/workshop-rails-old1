module Article::Comment::LikeMutator
  class << self
    def create!(comment, max_likes_count_per_hour: 5)
      return unless comment.can_be_liked?
      comment.likes.create! article: comment.article
    end
  end
end
