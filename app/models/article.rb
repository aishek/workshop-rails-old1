class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy, inverse_of: :article

  belongs_to :category, required: false

  state_machine :state, initial: :draft do
    state :draft
    state :moderation
    state :published

    event :moderate do
      transition draft: :moderation
    end

    event :publish do
      transition moderation: :published
    end

    event :draft do
      transition moderation: :draft
    end
  end
end
