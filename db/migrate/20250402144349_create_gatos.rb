class CreateGatos < ActiveRecord::Migration[7.2]
  def change
    create_table :gatos do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
