class CreateJoinTAbleGatosTags < ActiveRecord::Migration[7.2]
  def change
    create_join_table :gatos, :tags do |t|
      t.index [:gato_id, :tag_id]
      t.index [:tag_id, :gato_id]
    end
  end
end