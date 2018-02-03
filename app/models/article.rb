class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, required: false

  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :category, presence: true,
                       if: :published?

  state_machine :state, initial: :draft do
    state :draft
    state :moderation
    state :published

    event :moderate do
      transition draft: :moderation
    end
  end
end
