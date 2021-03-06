class Story < ApplicationRecord
  acts_as_paranoid
  include AASM
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged

  # 改用 paranoia gem，所以可以不用
  # default_scope { where(deleted_at: nil) }
  scope :is_draft, -> { where(status: 'draft') }
  scope :is_published, -> { where(status: 'published') }
  # 給 wellcome 首頁用
  scope :index_stories, -> { published.with_attached_cover.order(created_at: :desc).includes(:member) }

  belongs_to :member
  has_one_attached :cover
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

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

  # 改用 paranoia gem，所以可以不用
  # def destroy
  #   update(deleted_at: Time.now)
  # end

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
