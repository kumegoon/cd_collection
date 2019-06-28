class Comment < ApplicationRecord
  belongs_to :cd
  belongs_to :user
  enum evaluations: { one: 1, two: 2, three: 3, four: 4, five: 5 }

  validates :evaluation, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates_uniqueness_of :cd_id, scope: :user_id
end
