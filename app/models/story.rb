class Story < ApplicationRecord  
  include AASM
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged

  default_scope { where(deleted_at: nil) }
  scope :is_draft, -> { where(status: 'draft') }
  scope :is_published, -> { where(status: 'published') }

  belongs_to :member
  validates :title, presence: true

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  def destroy
    update(deleted_at: Time.now)
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def member_name
    member.try(:nickname) || member.email.split('@')[0]
  end

  def first_paragraph
    content.split(/[\r\n]+/)[0]
  end

  private

  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex.first(6)]
    ]
  end
end
