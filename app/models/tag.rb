class Tag < ApplicationRecord
  has_and_belongs_to_many :gatos, join_table: 'gatos_tags'

  validates :name, presence: true, uniqueness: true
end
