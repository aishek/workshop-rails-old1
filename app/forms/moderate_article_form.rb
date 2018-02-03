class ModerateArticleForm < Reform::Form
  property :state_event
  property :category_id

  validates :category_id, presence: true
end
