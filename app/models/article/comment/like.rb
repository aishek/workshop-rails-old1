class Article::Comment::Like < ApplicationRecord
  belongs_to :comment, counter_cache: true
end
