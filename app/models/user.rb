class User < ApplicationRecord
  ROLES = %w[user admin].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gatos, dependent: :destroy

  validates :role, inclusion: { in: ROLES }

  def admin?
    role == "admin"
  end
end
