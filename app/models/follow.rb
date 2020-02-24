class Follow < ApplicationRecord
  belongs_to :member
  belongs_to :following, class_name: 'Member', foreign_key: 'following_id'
end
