class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trackable, polymorphic: true, optional: true

  TYPES = [
    "page_view",
    "gato_view",
    "search",
    "registration",
    "login",
    "gato_create",
    "gato_update",
    "gato_delete"
  ].freeze

  validates :event_type, inclusion: { in: TYPES }
end
