class Cd < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :artist_name, presence: true, length: { maximum: 100 }
  validates :price, presence: true,
    numericality: { 
      only_integer: true,
      greater_than: 1
    }
  validates :description, presence: true, length: { maximum: 500 }
  validates :genre_id, presence: true,
    numericality: { 
      only_integer: true,
      greater_than: 1
    }
end
