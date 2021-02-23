class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { member: 0, vip: 1, platinum: 2, admin: 3 }

  validates :nickname, presence: true, uniqueness: true

  has_one_attached :avatar
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def paid?
    vip? || platinum?
  end

  def member_name
    nickname || email.split('@')[0]
  end

  def bookmark?(story)
    bookmarks.exists?(story: story)
  end

  def bookmark!(story)
    if bookmark?(story)
      bookmarks.find_by(story: story).destroy
      return '書籤已刪除'
    else
      bookmarks.create(story: story)
      return '書籤已建立'
    end
  end

  def follow?(member)
    # follows.where(following: member)
    follows.exists?
  end

  def follow!(member)
    if follow?(member)
      follows.find_by(following: member).destroy
      return '追蹤'
    else
      follows.create(following: member)
      return '已追蹤'
    end
  end
end
