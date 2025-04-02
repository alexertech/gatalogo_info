class Gato < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
end
