class Comment < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :member
  belongs_to :story

  validates :content, presence: true
end
