class AddIndicestoEvents < ActiveRecord::Migration[7.2]
  def change
    add_index :events, [:event_type, :created_at]
    add_index :events, [:trackable_type, :trackable_id, :created_at]
    add_index :events, [:user_id, :created_at]
  end
end