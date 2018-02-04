class Article::Comment::Like < ApplicationRecord
  belongs_to :comment, counter_cache: true
  belongs_to :article
end
