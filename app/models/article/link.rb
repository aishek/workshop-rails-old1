class Article < ApplicationRecord
  class Link < ApplicationRecord
    belongs_to :article
  end
end
