class FixGatosTagsJoinTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :join_t_able_gatos_tags if table_exists?(:join_t_able_gatos_tags)
    
    create_join_table :gatos, :tags do |t|
      t.index [:gato_id, :tag_id]
      t.index [:tag_id, :gato_id]
    end
  end
  
  def down
    drop_table :gatos_tags if table_exists?(:gatos_tags)
    
    create_table :join_t_able_gatos_tags do |t|
      t.string :gatos
      t.string :tags
      t.timestamps
    end
  end
  
  private
  
  def table_exists?(table_name)
    ActiveRecord::Base.connection.table_exists?(table_name)
  end
end
