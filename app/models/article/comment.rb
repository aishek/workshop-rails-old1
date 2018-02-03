class Article < ApplicationRecord
  class Comment < ApplicationRecord
    self.table_name = 'comments'

    belongs_to :article
    has_many :likes, dependent: :delete_all

    def to_partial_path
      'articles/comments/comment'.freeze
    end
  end
end
