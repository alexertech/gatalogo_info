class Gato < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
end
