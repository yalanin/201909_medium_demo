class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true

  has_one_attached :avatar
  has_many :stories
  has_many :comments, dependent: :destroy
  has_many :follows

  def member_name
    nickname || email.split('@')[0]
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
