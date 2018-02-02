class Article < ApplicationRecord
  class Comment < ApplicationRecord
    self.table_name = 'comments'

    belongs_to :article

    def to_partial_path
      'articles/comments/comment'.freeze
    end
  end
end
