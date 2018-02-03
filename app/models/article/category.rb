class Article < ApplicationRecord
  class Category < ApplicationRecord
    has_many :articles
  end
end
