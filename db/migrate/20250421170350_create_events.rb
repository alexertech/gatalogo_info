# Migración para el modelo Event
class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :event_type
      t.references :user, null: true, foreign_key: true
      t.references :trackable, polymorphic: true, null: true
      t.jsonb :metadata, default: {}
      t.string :ip_address
      t.string :user_agent
      t.timestamps
    end
    
    add_index :events, :event_type
    add_index :events, :created_at
  end
end