class User < ApplicationRecord
  # Include default devise modules
  # Temporarily disabled :registerable to prevent new sign-ups
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_many :gatos, dependent: :destroy
end
