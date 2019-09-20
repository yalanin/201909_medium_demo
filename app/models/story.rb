class Story < ApplicationRecord  
  include AASM
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
end
