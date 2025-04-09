class CreateJoinTAbleGatosTags < ActiveRecord::Migration[7.2]
  def change
    create_table :join_t_able_gatos_tags do |t|
      t.string :gatos
      t.string :tags

      t.timestamps
    end
  end
end
