class Story < ApplicationRecord  
  default_scope { where(deleted_at: nil) }

  belongs_to :member
  validates :title, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end
