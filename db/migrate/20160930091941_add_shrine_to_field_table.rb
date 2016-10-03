class AddShrineToFieldTable < ActiveRecord::Migration[5.0]
  def change
    add_column :cms9_fields, :image_data, :text
  end
  
end
