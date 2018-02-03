class Article < ApplicationRecord
  class Comment < ApplicationRecord
    class Like < ApplicationRecord
      self.table_name = 'article_comment_likes'

      belongs_to :comment, counter_cache: true
    end
  end
end
