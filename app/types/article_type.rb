class ArticleType < Article
  include ApplicationType

  permit :title, :text, links_attributes: [:id, :url, :_destroy]

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true,
                    length: { minimum: 5 }
end
