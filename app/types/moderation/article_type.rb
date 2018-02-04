module Moderation
  class ArticleType < Article
    include ApplicationType

    permit :state_event, :category_id

    validates :category, presence: true
  end
end
